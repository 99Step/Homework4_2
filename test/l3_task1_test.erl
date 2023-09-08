-module(l3_task1_test).

-include_lib("eunit/include/eunit.hrl").

-export([]).

task1_test_() ->
  [
    ?_assert(l3_task1:first_word(<<"Some Text"/utf8>>) =:= <<"Some">>),
    ?_assert(l3_task1:first_word(<<"Привіт світ"/utf8>>) =:= <<"Привіт">>),
    ?_assert(l3_task1:first_word(<<"">>) =:= <<"">>),
    ?_assert(l3_task1:first_word(<<"Some"/utf8>>) =:= <<"Some">>)
  ].