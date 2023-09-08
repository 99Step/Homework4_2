-module(l3_task3).

-export([split/2]).

split(BinText, Separator) ->
  split(BinText, list_to_binary(Separator), <<>>, []).

split(<<X, Rest/binary>>, <<X, Rest1/binary>> = Separator, Word, Acc) ->
  case check(Rest, Rest1) of
    false -> split(Rest, Separator, <<Word/binary, X>>, Acc);
    Res -> split(Res, Separator, <<>>, [Word | Acc])
  end;
split(<<X/utf8, Rest/binary>>, Separator, Word, Acc) ->
  split(Rest, Separator, <<Word/binary, X>>, Acc);
split(<<>>, _, Word, Acc) ->
  lists:reverse([Word | Acc]).

check(<<X, Rest/binary>>, <<X, Rest1/binary>>) ->
  check(Rest, Rest1);
check(Rest, <<>>) ->
  Rest;
check(_, _) ->
  false.