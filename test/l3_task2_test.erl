-module(l3_task2_test).

-include_lib("eunit/include/eunit.hrl").

-export([]).

task12_test_() ->
  [
    ?_assert(l3_task2:words(<<"Some Text"/utf8>>) =:= [<<"Some">>, <<"Text">>]),
    ?_assert(l3_task2:words(<<"Привіт світ"/utf8>>) =:= [<<"Привіт">>, <<"світ">>]),
    ?_assert(l3_task2:words(<<""/utf8>>) =:= [<<"">>]),
    ?_assert(l3_task2:words(<<"Some"/utf8>>) =:= [<<"Some">>])
  ].
