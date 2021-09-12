:- use_module(minimax).
:- use_module(frik-frak).

:- include('frik-frak.pl').
:- include('minimax.pl').

% play:
% Comecar o jogo
play :-
    nl,
    write('========================================'), nl,
    write('============= Projeto Prolog ==========='), nl,
    write('========================================'), nl, nl,
    write('(X) comeca o jogo'), nl,
    TabelaVazia = [0, 0, 0, 0, 0, 0, 0, 0, 0],
    mostrar(TabelaVazia), nl,
    play([x, play, TabelaVazia], x).      % Comecar o jogo com a tabela vazia



% play(+Position, +HumanPlayer):
% Se o próximo jogador a jogar em posição for igual ao HumanPlayer -> Humano deve jogar
% Pergunte ao humano o que fazer.
play([Player, play, Tabela], Player) :- !,
    nl, write('Proximo movimento ?'), nl,
    read(Pos), nl,                                  % ler a posicao a jogar
    (
      humanMove([Player, play, Tabela], [NextPlayer, State, NextTabela], Pos), !,
      mostrar(NextTabela),
      (
        State = win, !,                             % If (Player venceu) -> stop
        nl, write('Fim do jogo : '),
        write(Player), write(' venceu !'), nl, nl
        ;
        State = draw, !,                            % If (empate) -> stop
        nl, write('Fim do jogo : '),
        write(' empate !'), nl, nl
        ;
        play([NextPlayer, play, NextTabela], Player) % Else -> continuar o jogo
      )
      ;
      write('-> Movimento invalido !'), nl,          % If (posicao invalido) -> escolher de novo
      play([Player, play, Tabela], Player)        
    ).




% play(+Position, +HumanPlayer)
% Se nao é o humano a jogar -> Computador deve jogar
% Computar a melhor jogada para o computador com o minimax ou alpha-beta
play([Player, play, Tabela], HumanPlayer) :-
    
    nl, write('Computador jogou : '), nl, nl,
    
    % Compute the best move
    bestMove([Player, play, Tabela], [NextPlayer, State, BestSuccTabela]),
    mostrar(BestSuccTabela),
    (
      % If (computador venceu) -> stop
      State = win, !,                                 
      nl, write('End of game : '),
      write(Player), write(' win !'), nl, nl
      ;

      % If (empate) -> stop
      State = draw, !,                                
      nl, write('End of game : '), write(' draw !'), nl, nl
      ;
      
      % Else -> continuar o jogo
      play([NextPlayer, play, BestSuccTabela], HumanPlayer)
    ).



% nextPlayer(X1, X2)
% Verdadeiro se X2 for o próximo jogador a jogar após X1.
nextPlayer(o, x).
nextPlayer(x, o).

% Quando o humano joga
humanMove([X1, play, Tabela], [X2, State, NextTabela], Pos) :-
    nextPlayer(X1, X2),
    set1(Pos, X1, Tabela, NextTabela),
    (
      winPos(X1, NextTabela), !, State = win ;
      drawPos(X1,NextTabela), !, State = draw ;
      State = play
    ).




% set1(+Elem, +Pos, +List, -ResList).
% Setar Elem na posicao Pos na lista => Resultado na ResList.
% Rem : counting starts at 1.

set1(1, E, [X|Ls], [E|Ls]) :- !, X = 0.

set1(P, E, [X|Ls], [X|L2s]) :-
    number(P),
    P1 is P - 1,
    set1(P1, E, Ls, L2s).



% mostrar(+Tabela)
% mostrar a tabela para a saida corrente
mostrar([X1, X2, X3, X4, X5, X6, X7, X8, X9]) :-
    write('   '), mostrar2(X1),
    write(' | '), mostrar2(X2),
    write(' | '), mostrar2(X3), nl,
    write('  -----------'), nl,
    write('   '), mostrar2(X4),
    write(' | '), mostrar2(X5),
    write(' | '), mostrar2(X6), nl,
    write('  -----------'), nl,
    write('   '), mostrar2(X7),
    write(' | '), mostrar2(X8),
    write(' | '), mostrar2(X9), nl.




% mostrar2(+Term)
% escrever o termo para o corrente saida
% Replace 0 by ' '.

mostrar2(X) :-
    X = 0, !,
    write(' ').

mostrar2(X) :-
    write(X).


% bestMove(+Pos, -NextPos): 
% Calcule a melhor próxima posição a partir da posição Pos com o algoritmo minimax ou alfa-beta.

bestMove(Pos, NextPos) :-
    minimax(Pos, NextPos, _).