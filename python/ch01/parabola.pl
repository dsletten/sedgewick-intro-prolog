#!/opt/local/bin/swipl -q -t main -f
%%  -*- Mode: Prolog -*-
%   Name:               parabola.pl
%
%   Started:            Thu Jan 23 15:04:48 2025
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

:- module(parabola, []).

make_parabola(A, B, C, parabola(A, B, C, R1, R2)) :-
    calculate_roots(A, B, C, R1, R2).

get_A(parabola(A, _, _, _, _), A).
get_B(parabola(_, B, _, _, _), B).
get_C(parabola(_, _, C, _, _), C).
first_root(parabola(_, _, _, R, _), R).
second_root(parabola(_, _, _, _, R), R).

calculate_roots(A, B, C, R1, R2) :-
    Discriminant is B * B - 4 * A * C,
    D is sqrt(Discriminant),
    goldberg_roots(A, B, C, D, R1, R2).

normalize_root(R, N) :-
    R =:= 0,
    N is abs(R).
normalize_root(R, R) :- R =\= 0.

%%%  Goldberg -- What Every Computer Scientist Should Know... pg. 162
goldberg_roots(A, B, C, D, R1, R2) :-
    B >= 0,
    Root1 is (2 * C) / (-B - D),
    Root2 is (-B - D) / (2 * A),
    normalize_root(Root1, R1),
    normalize_root(Root2, R2).
goldberg_roots(A, B, C, D, R1, R2) :-
    B < 0,
    Root1 is (-B + D) / (2 * A),
    Root2 is (2 * C) / (-B + D),
    normalize_root(Root1, R1),
    normalize_root(Root2, R2).
