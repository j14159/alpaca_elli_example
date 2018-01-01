%%%-------------------------------------------------------------------
%% @doc alpaca_elli_example public API
%% @end
%%%-------------------------------------------------------------------

-module(alpaca_elli_example_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    alpaca_elli_example_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================