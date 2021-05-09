/* chech if final state is a member of current states */
reach(SS, FS, []) :- 
    member(FS,SS).


/* check if reachable via next states generated via head and input tail */
/* if it isnt, continue on the next items of current state */
reach([SSH|SST], FS, [IH|IT]) :- 
    transition(SSH,IH,NS),    
    reach(NS,FS,IT);
    reach(SST,FS,I). 


/* call with start state as a list */
reachable(StartState, FinalState, Input) :-
    reach([StartState],FinalState,Input).
