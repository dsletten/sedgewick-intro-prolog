#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               polar_coordinates.pl
%
%   Started:            Sat Feb 22 14:32:18 2025
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
%   Notes: Ex. 1.2.23
%
%%

:- initialization(main, main).

hypotenuse(A, B, C) :-
    C is sqrt(A*A + B*B).

cartesian_polar(X, Y, R, Theta) :-
    hypotenuse(X, Y, R),
    Theta is atan2(Y, X).

validate(ArgX, ArgY) :-
    atom_number(ArgX, X),
    atom_number(ArgY, Y),
    !,
    cartesian_polar(X, Y, R, Theta),
    write("("),
    write(X),
    write(","),
    write(Y),
    write(") -> r: "),
    write(R),
    write(" θ: "),
    write(Theta),
    nl.

validate(_, _) :-
    write("Corrupt"),
    nl.

main([ArgX, ArgY]) :-
    validate(ArgX, ArgY).
