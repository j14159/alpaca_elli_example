%%%-------------------------------------------------------------------
%% @doc alpaca_elli_example top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(alpaca_elli_example_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    {ok, Pid} = elli:start_link([{callback, alpaca_endpoint}, {port, 3000}]),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.


%%====================================================================
%% Internal functions
%%====================================================================
