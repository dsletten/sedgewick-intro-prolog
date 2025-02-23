#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               compound_interest.pl
%
%   Started:            Mon Feb 17 14:29:26 2025
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
%   Notes:  Ex. 1.2.21
%
%%

:- initialization(main, main).

compound(P, R, T, A) :-
    A is P * exp(R * T).

valid(X) :-
    X > 0.

validate(P, R, T) :-
    valid(P),
    valid(R),
    valid(T),
    !,
    R100 is R / 100.0,
    compound(P, R100, T, A),
    write("Amount: "),
    write(A),
    nl.

validate(_, _, _) :-
    write("Corrupt"),
    nl.

main([ArgP, ArgR, ArgT]) :-
    atom_number(ArgP, P),
    atom_number(ArgR, R),
    atom_number(ArgT, T),
    validate(P, R, T).
    
