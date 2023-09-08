-module(l3_task4_test).

-include_lib("eunit/include/eunit.hrl").

-include("l3_include.hrl").

-export([]).

task12_test_() ->
  [
    ?_assert(l3_task4:decode(?JSON, proplist) =:= ?PROPLIST),
    ?_assert(l3_task4:decode(?JSON, map) =:= ?MAP)
  ].