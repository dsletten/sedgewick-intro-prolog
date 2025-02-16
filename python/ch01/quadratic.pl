#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               quadratic.pl
%   Started:            Sun Jan 26 13:54:54 2025
%   Modifications:
%
%   Purpose:
%
%
%
%   Calling Sequence:
%   quadratic.pl 1 -16 63
%
%   Inputs:
%
%   Outputs:
%
%   Example:
%
%   Notes:
%
%%

:- initialization(main, main).
:- use_module(parabola).

main([ArgA, ArgB, ArgC]) :-
    atom_string(ArgA, Sa),
    atom_string(ArgB, Sb),
    atom_string(ArgC, Sc),
    number_string(A, Sa),
    number_string(B, Sb),
    number_string(C, Sc),
    parabola:make_parabola(A, B, C, parabola(A, B, C, R1, R2)),
    write("Root 1: "),
    write(R1),
    nl,
    write("Root 2: "),
    write(R2),
    nl.

    
