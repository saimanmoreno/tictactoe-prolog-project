% move(+Pos, -NextPos)
% Verdadeiro se houver uma mudança legal (de acordo com as regras) de Pos para NextPos.

move([X1, play, Board], [X2, win, NextBoard]) :-
    nextPlayer(X1, X2),
    move_aux(X1, Board, NextBoard),
    winPos(X1, NextBoard), !.

move([X1, play, Board], [X2, draw, NextBoard]) :-
    nextPlayer(X1, X2),
    move_aux(X1, Board, NextBoard),
    drawPos(X1,NextBoard), !.

move([X1, play, Board], [X2, play, NextBoard]) :-
    nextPlayer(X1, X2),
    move_aux(X1, Board, NextBoard).

% move_aux(+Player, +Board, -NextBoard)
% Verdadeiro se o NextBoard é Board com uma caixa vazia substituída pela marca Player.

move_aux(P, [0|Bs], [P|Bs]).

move_aux(P, [B|Bs], [B|B2s]) :-
    move_aux(P, Bs, B2s).


% min_to_move(+Pos)
% Verdadeiro se o próximo jogador a jogar for o MIN.
min_to_move([o, _, _]).

% max_to_move(+Pos)
% Verdadeiro se o próximo jogador a jogar for o jogador MAX.
max_to_move([x, _, _]).

% utility(+Pos, -Val) :-
% Verdadeiro se Val for o resultado da função de avaliação no Pos.
% Apenas avaliaremos a posição final.
% Portanto, teremos apenas vitória MAX, vitória MIN ou empate.
% Usaremos 1 quando MAX vencer
%         -1 quando MIN vencer
%          0 empate

utility([o, win, _], 1).       % proximo jogador (MAX) venceu.
utility([x, win, _], -1).      % jogador anterior (MIN) venceu.
utility([_, draw, _], 0).

% winPos(+Player, +Board)
% Verdadeiro se o jogador vencer no tabuleiro.

winPos(P, [X1, X2, X3, X4, X5, X6, X7, X8, X9]) :-
    equal(X1, X2, X3, P) ;    % 1st line
    equal(X4, X5, X6, P) ;    % 2nd line
    equal(X7, X8, X9, P) ;    % 3rd line
    equal(X1, X4, X7, P) ;    % 1st col
    equal(X2, X5, X8, P) ;    % 2nd col
    equal(X3, X6, X9, P) ;    % 3rd col
    equal(X1, X5, X9, P) ;    % 1st diag
    equal(X3, X5, X7, P).     % 2nd diag

% drawPos(+Player, +Board)
% Verdadeiro se o jogo empatar

drawPos(_,Board) :-
    \+ member(0, Board).


% equal(+W, +X, +Y, +Z).
% True if W = X = Y = Z.

equal(X, X, X, X).
