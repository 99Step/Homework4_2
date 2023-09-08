-module(l3_task4).

-export([decode/2]).

decode(Json, map) ->
  decode_map(Json, maps:new());
decode(Json, proplist) ->
  decode_proplist(Json, []).

decode_map(<<",", Rest/binary>>, Map) ->
  {Key, Value, Rest1} = decode(Rest, <<>>, <<>>, map),
  decode_map(Rest1, maps:put(Key, Value, Map));
decode_map(<<"{", Rest/binary>>, Map) ->
  {Key, Value, Rest1} = decode(Rest, <<>>, <<>>, map),
  decode_map(Rest1, maps:put(Key, Value, Map));
decode_map(<<X, Rest/binary>>, Map) when X =:= 10 orelse X =:= 32 ->
  decode_map(Rest, Map);
decode_map(<<"}">>, Map) ->
  Map;
decode_map(<<"}", Rest/binary>>, Map) ->
  {Map, Rest}.

decode_proplist(<<",", Rest/binary>>, PropList) ->
  {Key, Value, Rest1} = decode(Rest, <<>>, <<>>, proplist),
  decode_proplist(Rest1, [{Key, Value} | PropList]);
decode_proplist(<<"{", Rest/binary>>, PropList) ->
  {Key, Value, Rest1} = decode(Rest, <<>>, <<>>, proplist),
  decode_proplist(Rest1, [{Key, Value} | PropList]);
decode_proplist(<<X, Rest/binary>>, PropList) when X =:= 10 orelse X =:= 32 ->
  decode_proplist(Rest, PropList);
decode_proplist(<<"}">>, PropList) ->
  lists:reverse(PropList);
decode_proplist(<<"}", Rest/binary>>, PropList) ->
  {lists:reverse(PropList), Rest}.

decode(<<"'", Rest/binary>>, <<>>, <<>> = Value, Flag) ->
  {Key, Rest1} = decode_name(Rest, <<>>),
  decode(Rest1, Key, Value, Flag);
decode(<<"'", Rest/binary>>, Key, <<>>, _) ->
  {Value, Rest1} = decode_name(Rest, <<>>),
  {Key, Value, Rest1};
decode(<<":", Rest/binary>>, Key, Value, Flag) ->
  decode(Rest, Key, Value, Flag);
decode(<<"[", Rest/binary>>, Key, <<>>, Flag) ->
  {Value, Rest1} = decode_list(Rest, [], Flag),
  {Key, Value, Rest1};
decode(<<X, Rest/binary>>, Key, Value, Flag) when X =:= 10 orelse X =:= 32 ->
  decode(Rest, Key, Value, Flag);
decode(<<"true" , Rest/binary>>, Key, <<>>, _) ->
  {Key, true, Rest};
decode(<<"false" , Rest/binary>>, Key, <<>>, _) ->
  {Key, false, Rest};
decode(Rest, Key, <<>>, _) ->
  {Value, Rest1} = decode_number(Rest, <<>>),
  {Key, Value, Rest1}.

decode_list(<<"{", _/binary>> = Rest, List, Flag) ->
  {Value, Rest1} =
    case Flag of
      map -> decode_map(Rest, maps:new());
      proplist -> decode_proplist(Rest, [])
    end,
  decode_list(Rest1, [Value | List], Flag);
decode_list(<<"'", Rest/binary>>, List, Flag) ->
  {Name, Rest1} = decode_name(Rest, <<>>),
  decode_list(Rest1, [Name | List], Flag);
decode_list(<<",", Rest/binary>>, List, Flag) ->
  decode_list(Rest, List, Flag);
decode_list(<<"]", Rest/binary>>, List, _) ->
  {List, Rest};
decode_list(<<X, Rest/binary>>, List, Flag) when X =:= 10 orelse X =:= 32 ->
  decode_list(Rest, List, Flag).

decode_name(<<"'", Rest/binary>>, Name) ->
  {Name, Rest};
decode_name(<<X, Rest/binary>>, Name)->
  decode_name(Rest, <<Name/binary, X>>).

decode_number(<<",", _/binary>> = Rest, Number) ->
  {binary_to_integer(Number), Rest};
decode_number(<<X:1/binary, Rest/binary>>, Number) ->
  decode_number(Rest, <<Number/binary, X/binary>>).