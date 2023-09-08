-module(l3_task3_test).

-include_lib("eunit/include/eunit.hrl").

-export([]).

task12_test_() ->
  [
    ?_assert(l3_task3:split(<<"Some-:-Text"/utf8>>, <<"-:-">>) =:= [<<"Some">>, <<"Text">>]),
    ?_assert(l3_task3:split(<<"Прив=:іт=:=світ"/utf8>>, <<"=:=">>) =:= [<<"Прив=:іт">>, <<"світ">>]),
    ?_assert(l3_task3:split(<<""/utf8>>, <<"=:=">>) =:= [<<"">>]),
    ?_assert(l3_task3:split(<<"Some"/utf8>>, <<"=:=">>) =:= [<<"Some">>])
  ].
