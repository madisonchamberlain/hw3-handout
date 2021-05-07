/* union if all sets empty */
isUnion([],[],[]).

/* union if one set empty, and other set = union */
isUnion(Set1, [], Set1).

/* if the head of set2 = head of union, and head is not in the other set, recurse on the tail */
isUnion(Set1, [H2|T2], [H2|Union]) :-
not(member(H2, Set1)), isUnion(Set1, T2, Union).

/* if h2 is a member of set1, recurse on all of union, not just the tail */
isUnion(Set1, [H2|T2], Union) :-
member(H2, Set1), isUnion(Set1, T2, Union).





/* intersection if all sets empty */
isIntersection([], Set2, []).

/* if the first item of Set1 in Set2, and is first item of intersection */
/*recurse on tail of set1 and tail of set2 */
isIntersection([H1|T1], Set2, [H1|Intersection]) :-
member(H1, Set2), isIntersection(T1, Set2, Intersection).

/* if the first item of Set1 not in set2, only recurse on the tail of Set1 */
isIntersection([H1|T1], Set2, Intersection) :-
not(member(H1, Set2)), isIntersection(T1, Set2, Intersection).




/* equal if both are blank */
isEqual([], []).

/* if set2 without H1 isEqual to tail1 */
isEqual([H1|T1], Set2) :-
    select(H1, Set2, Short2),
    isEqual(T1, Short2).
