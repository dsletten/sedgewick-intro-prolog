#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               random_range.pl
%
%   Started:            Tue Feb 11 19:52:45 2025
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
%   Notes: Ex. 1.2.16
%
%%

:- initialization(main, main).

random_range(A, B, R) :-
    set_random(seed(random)),
    random_between(A, B, R).

valid(X) :-
    0 =:= float_fractional_part(X).

validate(A, B) :-
    valid(A),
    valid(B),
    !,
    A1 is truncate(A),
    B1 is truncate(B),
    random_range(A1, B1, R),
    write("Random ["),
    write(A1),
    write(","),
    write(B1),
    write("]: "),
    write(R),
    nl.

validate(_, _) :-
    write("Corrupt"),
    nl.

main([ArgA, ArgB]) :-
    atom_number(ArgA, A),
    atom_number(ArgB, B),
    validate(A, B).
