-module(m8ball_app).
-behaviour(application).
-export([start/2, stop/1]).
-export([ask/1]).
-include("m8ball.hrl").

%%%%%%%%%%%%%%%%%
%%% CALLBACKS %%%
%%%%%%%%%%%%%%%%%
start(normal, []) ->
    start_common();
start({takeover, _OtherNode}, []) ->
    start_common().

stop(_State) ->
    ok.

%%%%%%%%%%%%%%%%%
%%% INTERFACE %%%
%%%%%%%%%%%%%%%%%
ask(Question) ->
    m8ball_server:ask(Question).

%%%%%%%%%%%%%%%%%
%%% INTERNAL  %%%
%%%%%%%%%%%%%%%%%
start_common() ->
    application:start(folsom),
    folsom_metrics:new_counter(?COUNTER),
    m8ball_sup:start_link().
