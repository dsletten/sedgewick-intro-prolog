#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               wind_chill.pl
%
%   Started:            Wed Feb 19 19:22:36 2025
%   Modifications:
%
%   Purpose:
%
%
%
%   Calling Sequence:
%
%
%   Inputs:
%
%   Outputs:
%
%   Example:
%
%   Notes:  Ex. 1.2.22
%
%%

:- initialization(main, main).

valid_temperature(T) :-
    T >= -50,
    T =< 120.

valid_wind_speed(V) :-
    V >= 3,
    V =< 120.

wind_chill(T, V, W) :-
    W is 35.74 + 0.6215 * T + (0.4275 * T - 35.75) * (V ** 0.16).

validate(T, V) :-
    valid_temperature(T),
    valid_wind_speed(V),
    !,
    wind_chill(T, V, W),
    write("Wind chill: "),
    write(W),
    nl.

validate(_, _) :-
    write("Corrupt"),
    nl.

main([ArgT, ArgV]) :-
    atom_number(ArgT, T),
    atom_number(ArgV, V),
    validate(T, V).
    

