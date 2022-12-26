%%%-------------------------------------------------------------------
%% @doc tddVendingMachineErlang public API
%% @end
%%%-------------------------------------------------------------------

-module(tddVendingMachineErlang_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    io:fwrite("hello, world\n"),
    tddVendingMachineErlang_sup:start_link().

stop(_State) ->
    gen_server:call(?MODULE, stop),
    ok.

%% internal functions
