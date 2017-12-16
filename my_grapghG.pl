node(a). 
node(b).
node(c).
node(d). 
node(e). 
node(f). 
node(g). 
node(h). 
edge(a, b). 
edge(b, c). 
edge(c, a). 
edge(c, e). 
edge(c, d). 
edge(d, e). 
edge(d, h). 
edge(e, g). 
edge(e, f). 
edge(f, g). 
edge(g, e).


parent(X, Y):- edge(X, Y). 

child(X, Y):- parent(Y, X). 

ancestor(X,Y):- path(X,Y,_).

path(X,Y,Path) :- path(X,Y,[], P), reverse(P, Path). 
path(X,X,T,[X|T]). 
path(X,Y,P, R) :- edge(X,Z) , not(member(Z,P)) , path(Z,Y,[X|P], R). 

length_of_path( X, Y, L):- path(X, Y, P), length(P, T), L is T - 1. 

connected( X, Y):- path(X, Y, _); path(Y, X, _).

undirected_edge(X, Y):- edge(X, Y). 
undirected_edge(X, Y):- edge(Y, X). 

undirected_path(X,Y,UP) :- undirected_path(X,Y,[], P), reverse(P, UP). 
undirected_path(X,X,T,[X|T]). 
undirected_path(X,Y,P, R) :- undirected_edge(X,Z) , not(member(Z,P)) , undirected_path(Z,Y,[X|P], R).