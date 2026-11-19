
% Shopping Menu

basket([coffee, milk, chocolate, apple, juice]).

start :-
    basket(L),
    menu(L).

menu(L) :-
    nl,
    write(' Shopping List: '), nl,
    write(' d. display all items. '), nl,
    write(' a. add an item to the list. '), nl,
    write(' e. exit. '), nl,
    write(' Enter your choice: '),
    read(C),
    action(C, L).

action(d, L) :-
    display_items(L),
    menu(L).

action(a, L) :-
    write(' Enter the item you want to add: '), nl,
    read(X),
    add(X, L, L1),
    write(' The item has been added! '), nl,
    menu(L1).

action(e, _) :-
    write(' Goodbye! '), nl.

action(C, L) :-
    C \= d,
    C \= a,
    C \= e,
    write(' Invalid choice. '), nl,
    menu(L).

% Display items using recursion

display_items([]).

display_items([H|T]) :-
    write(H), nl,
    display_items(T).

% Add an item to the beginning of the list

add(X, L, [X|L]).

% Concatenation

conc([], L, L).

conc([X|L1], L2, [X|L3]) :-
    conc(L1, L2, L3).
