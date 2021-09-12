# tictactoe-prolog-project
Criação do jogo da velha (tic tac toe) em Prolog

Para o projeto da disciplina de programação em logica, 3º ano do curso de Engenharia Informática e de 
Computadores, o nosso grupo composto por eu, Simão Moreno e Ariana Horta, sugerimos o tema que consiste 
na criação do jogo Frik Frak, em crioulo, mas conhecido como o jogo da velha em português. O jogo será 
desenvolvido utilizando a linguagem Prolog e a interface na linguagem Java (javafx)

<h3> Descrição </h3>
O jogo da velha é um jogo e passatempo popular. É um jogo de regras extremamente simples, que não traz 
grandes dificuldades para seus jogadores e é facilmente aprendido. Analisando o número de possibilidades de forma 
simplista, existem 362.880 (ou 9!) maneiras de se dispor a cruz e o círculo no tabuleiro, sem considerar jogadas 
vencedoras. Quando consideramos as combinações vencedoras, existem 255.168 jogos possíveis. Assumindo que 
'X' inicia o jogo (se considerar que 'O' inicia, os resultados passam a ser inversos), temos:

- 131.184 jogos finalizados são ganhos por 'X'
  - 1.440 são ganhos por 'X' após 5 movimentos
  - 47.952 são ganhos por 'X' após 7 movimentos
  - 81.792 são ganhos por 'X' após 9 movimentos

- 77.904 jogos finalizados são ganhos por 'O'
  - 5.328 são ganhos por 'O' após 6 movimentos
  - 72.576 são ganhos por 'O' após 8 movimentos

- 46.080 jogos finalizados resultam em empate

![image](https://user-images.githubusercontent.com/49438293/132966629-cb9415a2-ae81-4b4a-8df8-00f75c0dfd19.png)

<h3> Requisitos do Sistema </h3>

O jogo vai consistir de dois jogadores, sendo uma pessoa e a outra o computador. A linguagem Prolog será usado 
como parte da inteligência artificial para determinar as jogadas do computador de forma automática e da melhor 
jogada possível. Possivelmente (dependendo do cumprimento dos objetivos principais), o jogo poderá dispor de 
níveis (fácil, medio ou impossível kkk) a escolha do utilizador. Este também poderá escolher entre o X e o O. O 
jogo vai dispor de um score no topo e uma opção de reiniciar a partida. A partida e vencida quando os jogadores 
conseguirem 10 vitorias. Poderá haver empates, onde nenhum jogador não ganha pontos. Apos cada vitoria parcial 
no jogo, o jogo muda automaticamente o jogador inicial (se X vencer, o O jogara primeiro na próxima roda, e assim 
sucessivamente)

