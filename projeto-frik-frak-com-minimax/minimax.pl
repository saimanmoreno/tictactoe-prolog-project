% minimax(Pos, BestNextPos, Val):
% Pos é uma posicao, Val é o seu valor minimo
% A melhor jogada de Pos leva à posição BestNextPos.

minimax(Pos, BestNextPos, Val) :-                       % Pos nao tem sucessor
    bagof(NextPos, move(Pos, NextPos), NextPosList),    
    best(NextPosList, BestNextPos, Val), !.

minimax(Pos, _, Val) :-                                 % Pos tem successor
    utility(Pos, Val).


best([Pos], Pos, Val) :-
    minimax(Pos, _, Val), !.

best([Pos1 | PosList], BestPos, BestVal) :-
    minimax(Pos1, _, Val1),
    best(PosList, Pos2, Val2),
    betterOf(Pos1, Val1, Pos2, Val2, BestPos, BestVal).


betterOf(Pos0, Val0, _, Val1, Pos0, Val0) :-            % Pos0 melhor que Pos1
    min_to_move(Pos0),                                  % MIN para movimentar na Pos0
    Val0 > Val1, !                                      % MAX prefere o maior valor
    ;
    max_to_move(Pos0),                                  % MAX para mover na Pos0
    Val0 < Val1, !.                                     % MIN prefere a menor posicao

betterOf(_, _, Pos1, Val1, Pos1, Val1).                 % De outra forma Pos1 melhor que Pos0
