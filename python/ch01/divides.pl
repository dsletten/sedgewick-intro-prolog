#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               divides.pl
%
%   Started:            Sun Feb  2 20:49:16 2025
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
%   Notes:
%
%%

:- initialization(main, main).

valid(M) :- M >= 0.

divides(M, N) :-
    M mod N =:= 0.
divides(M, N) :-
    N mod M =:= 0.

categorize(M, N) :-
    valid(M),
    valid(N),
    divides(M, N),
    !,
    write("True"),
    nl.

categorize(M, N) :-
    valid(M),
    valid(N),
    !,
    write("False"),
    nl.

categorize(_, _) :-
    write("Corrupt"),
    nl.

main([ArgM, ArgN]) :-
    atom_string(ArgM, Sm),
    atom_string(ArgN, Sn),
    number_string(M, Sm),
    number_string(N, Sn),
    categorize(M, N).
