-module(l3_task1).

-export([first_word/1]).

first_word(BinText) ->
  first_word(BinText, <<>>).

first_word(<<32, _Rest/binary>>, Acc) ->
  Acc;
first_word(<<X/utf8, Rest/binary>>, Acc)->
  first_word(Rest, <<Acc/binary, X>>);
first_word(<<>>, Acc) ->
  Acc.

