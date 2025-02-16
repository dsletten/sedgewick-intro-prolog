#!/usr/bin/swipl
%%  -*- Mode: Prolog -*-
%   Name:               triangle.pl
%
%   Started:            Tue Feb  4 22:47:17 2025
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
%   Notes: Ex. 1.2.12
%
%%

%%%
%%%    https://en.wikipedia.org/wiki/Triangle_inequality
%%%
%%%    Explicitly: a + b > c  &  b + c > a  &  a + c > b
%%%    Equivalently: |a - b| < c < a + b
%%%    or
%%%    max(a, b, c) < a + b + c - max(a, b, c) => 2 max(a, b, c) < a + b + c
%%%    or
%%%    Area of triangle > 0.
%%%    

:- initialization(main, main).

valid(X) :-
    X >= 0,
    0 =:= float_fractional_part(X).

not_triangle(A, B, C) :-
    A >= B + C.
not_triangle(A, B, C) :-
    B >= A + C.
not_triangle(A, B, C) :-
    C >= A + B.

triangle_sedgewick(A, B, C) :-
    \+ not_triangle(A, B, C).

triangle(A, B, C) :-
    A < B + C,
    B < A + C,
    C < A + B.

triangle_abs(A, B, C) :-
    abs(A - B) < C,
    C < A + B.

triangle_max(A, B, C) :-
    max_list([A, B, C], M),
    M * 2 < A + B + C.

%%%
%%%    Assumes A ≥ B ≥ C
%%%    
heron([A, B, C], Area) :-
    Product is (A + (B + C)) * (C - (A - B)) * (C + (A - B)) * (A + (B - C)),
    Product >= 0,
    !,
    Area is sqrt(Product) / 4.

heron(_, 0).

goldberg_heron(A, B, C, Area) :-
    sort(0, @>=, [A, B, C], Sides),
    heron(Sides, Area).

triangle_area(A, B, C) :-
    goldberg_heron(A, B, C, Area),
    Area > 0.

categorize_sedgewick(A, B, C) :-
    triangle_sedgewick(A, B, C),
    !,
    write("True"),
    nl.

categorize_sedgewick(_, _, _) :-
    write("False"),
    nl.

categorize(A, B, C) :-
    triangle(A, B, C),
    !,
    write("True"),
    nl.

categorize(_, _, _) :-
    write("False"),
    nl.

categorize_abs(A, B, C) :-
    triangle_abs(A, B, C),
    !,
    write("True"),
    nl.

categorize_abs(_, _, _) :-
    write("False"),
    nl.

categorize_max(A, B, C) :-
    triangle_max(A, B, C),
    !,
    write("True"),
    nl.

categorize_max(_, _, _) :-
    write("False"),
    nl.

categorize_area(A, B, C) :-
    triangle_area(A, B, C),
    !,
    write("True"),
    nl.

categorize_area(_, _, _) :-
    write("False"),
    nl.

validate(A, B, C) :-
    valid(A),
    valid(B),
    valid(C),
    !,
    categorize_sedgewick(A, B, C),
    categorize(A, B, C),
    categorize_abs(A, B, C),
    categorize_max(A, B, C),
    categorize_area(A, B, C).

validate(_, _, _) :-
    write("Corrupt"),
    nl.

main([ArgA, ArgB, ArgC]) :-
    atom_string(ArgA, Sa),
    atom_string(ArgB, Sb),
    atom_string(ArgC, Sc),
    number_string(A, Sa),
    number_string(B, Sb),
    number_string(C, Sc),
    validate(A, B, C).
