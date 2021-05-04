/* check if any item from FL in SL */
item_in_list([H|T], SL) :-
    /* if H is a member of SL */
    not(member(H,SL)), item_in_list(T, SL);
    /* or if it is not a member but one of the next is */
    member(H, SL).



/* All novels published during the year 1953 or 1996*/
year_1953_1996_novels(Book) :-
    /* true if book is a novel from 1953 OR 1996*/
    novel(Book,1953); novel(Book,1996).

/* List of all novels published during the period 1800 to 1900*/
period_1800_1900_novels(Book) :-
   /* True if Book written year YEAR, where YEAR between 1800 and 1900 */
   novel(Book,YEAR), YEAR >= 1800, YEAR =< 1900.

/* Characters who are fans of LOTR */
lotr_fans(Fan) :-
    /* BOOKS are the books that Fan likes */
    fan(Fan, BOOKS),
    /* True if lord of the rings is in the list of books, BOOKS*/
    member(the_lord_of_the_rings, BOOKS).

/* Authors of the novels owned by Chandler */
author_names(Author) :-
    /* CBOOKS are books that chandler is a fan of */
    fan(chandler, CBOOKS),
    /* ABOOKS are books written by a given author */
    author(Author, ABOOKS),
    /* determine if any item in ABOOKS is also in FBOOKS */
    item_in_list(CBOOKS, ABOOKS).


/* Characters who are fans of Brandon Sanderson's novels */
fans_names(Fan) :-
    /* FBOOKS is a list of books that Fan likes */
    fan(Fan, FBOOKS),
    /* ABOOKS is a list of books written by brandon sanders */
    author(brandon_sanderson, ABOOKS),
    /* determine if any item in ABOOKS is also in FBOOKS */
    item_in_list(ABOOKS, FBOOKS).

/* determine if P1 and P2 both like Book */
have_book_in_common(Book, P1, P2) :-
    /* find the list of books liked by person 1  */
    fan(P1,BOOKS1),
    /* find the list of books liked by person 2 */
    fan(P2,BOOKS2),
    /* Book must be a member of BOOKS1 and BOOKS2 */
    member(Book,BOOKS1), member(Book,BOOKS2).



/* Novels common between either of Phoebe, Ross, and Monica */
mutual_novels(Book) :-
    /* if Book is a member of Pheobe and Ross */
    have_book_in_common(Book, phoebe, ross);
    /* if Book is a member of Pheobe and Monica*/
    have_book_in_common(Book, phoebe, monica);
    /* if Book is a member of Ross and Monica */
    have_book_in_common(Book, ross, monica).
