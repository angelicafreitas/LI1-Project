{-|
Module      : Tarefa1_2017li1g104
Description : Módulo correspondente à Tarefa 1

Funções associadas à Tarefa 1 do projeto _Micro-Machines_ de LI1 em 2017/18.
-}

module Tarefa1_2017li1g104 where

import Data.Char
import Data.List
import LI11718


{-|
'testesT1': caminhos-modelo para testar a validade do código
-}
testesT1 :: [Caminho]
testesT1 = [[Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir],[CurvaDir,Sobe,Avanca,Avanca,CurvaEsq,Avanca],[Avanca,CurvaEsq,Avanca,Desce,Avanca,CurvaEsq,Avanca,Avanca,Sobe,CurvaEsq],[Desce,Avanca,CurvaDir,Desce,Avanca,CurvaDir,Sobe,CurvaDir,Avanca,Avanca,CurvaDir]]


{-|
'constroi': função que, dado um caminho, constroi um mapa a partir de uma orientação inicial Este, calculando a partida do caminho
-}
constroi :: Caminho -> Mapa
constroi c = Mapa (partida c, Este) (criarTMapa (partida c) c Este 0 (tabuleiroVazio (dimensao c)))


{-|
'criarTMapa': função que, a partir de uma posição inicial, de um caminho, de uma orientação e altura iniciais e de um tabuleiro, constroi um novo tabuleiro com as peças correspondentes ao caminho incorporadas nas respetivas posições
-}
criarTMapa :: Posicao -> Caminho -> Orientacao -> Altura -> Tabuleiro -> Tabuleiro
criarTMapa (x,y) [ ] o n tab = tab
criarTMapa (x,y) (h : t) o n [ ] = [ ]
criarTMapa (x,y) (h : t) o n tab
	|(h == Avanca && o == Norte) = criarTMapa (x,y-1) t Norte n (subTab tab (Peca Recta n) (x,y))
	|(h == Avanca && o == Sul) = criarTMapa (x,y+1) t Sul n (subTab tab (Peca Recta n) (x,y))
	|(h == Avanca && o == Este) = criarTMapa (x+1,y) t Este n (subTab tab (Peca Recta n) (x,y))
	|(h == Avanca && o == Oeste) = criarTMapa (x-1,y) t Oeste n (subTab tab (Peca Recta n) (x,y))
	|(h == Sobe && o == Norte) = criarTMapa (x,y-1) t Norte (n+1) (subTab tab (Peca (Rampa Norte) (n)) (x,y))
	|(h == Sobe && o == Sul) = criarTMapa (x,y+1) t Sul (n+1) (subTab tab (Peca (Rampa Sul) (n)) (x,y))
	|(h == Sobe && o == Este) = criarTMapa (x+1,y) t Este (n+1) (subTab tab (Peca (Rampa Este) (n)) (x,y))
	|(h == Sobe && o == Oeste) = criarTMapa (x-1,y) t Oeste (n+1) (subTab tab (Peca (Rampa Oeste) (n)) (x,y))
	|(h == Desce && o == Norte) = criarTMapa (x,y-1) t Norte (n-1) (subTab tab (Peca (Rampa Sul) (n-1)) (x,y))
	|(h == Desce && o == Sul) = criarTMapa (x,y+1) t Sul (n-1) (subTab tab (Peca (Rampa Norte) (n-1)) (x,y))
	|(h == Desce && o == Este) = criarTMapa (x+1,y) t Este (n-1) (subTab tab (Peca (Rampa Oeste) (n-1)) (x,y))
	|(h == Desce && o == Oeste) = criarTMapa (x-1,y) t Oeste (n-1) (subTab tab (Peca (Rampa Este) (n-1)) (x,y))
	|(h == CurvaDir && o == Norte) = criarTMapa (x+1,y) t Este n (subTab tab (Peca (Curva Norte) n) (x,y))
	|(h == CurvaDir && o == Sul) = criarTMapa (x-1,y) t Oeste n (subTab tab (Peca (Curva Sul) n) (x,y))
	|(h == CurvaDir && o == Este) = criarTMapa (x,y+1) t Sul n (subTab tab (Peca (Curva Este) n) (x,y))
	|(h == CurvaDir && o == Oeste) = criarTMapa (x,y-1) t Norte n (subTab tab (Peca (Curva Oeste) n) (x,y))
	|(h == CurvaEsq && o == Norte) = criarTMapa (x-1,y) t Oeste n (subTab tab (Peca (Curva Este) n) (x,y))
	|(h == CurvaEsq && o == Sul) = criarTMapa (x+1,y) t Este n (subTab tab (Peca (Curva Oeste) n) (x,y))
	|(h == CurvaEsq && o == Este) = criarTMapa (x,y-1) t Norte n (subTab tab (Peca (Curva Sul) n) (x,y))
	|(h == CurvaEsq && o == Oeste) = criarTMapa (x,y+1) t Sul n (subTab tab (Peca (Curva Norte) n) (x,y))



{-|
'tabuleiroVazio': função que, dada uma dimensão específica (número de colunas e de linhas), constroi um tabuleiro composto apenas por peças do tipo Lava
-}
tabuleiroVazio :: Dimensao -> Tabuleiro
tabuleiroVazio (colunas,linhas) = replicate linhas (replicate colunas (Peca Lava altLava))


{-|
'subLineTab': a função que, dada uma lista de peças, uma peça específica e a posição que essa peça na irá ocupar na lista (valor x), produz uma nova lista de peças
-}
subLineTab :: [Peca] -> Peca -> Int -> [Peca]
subLineTab [ ] (Peca a b) x = [ ]
subLineTab (h : t) (Peca a b) x
    |(x == 0) = ((Peca a b) : t)
    |(x > 0) = (h : (subLineTab t (Peca a b) (x-1)))


{-|
'subTab': função que, dado um tabuleiro, uma peça específica e a posição que essa peça irá ocupar no tabuleiro (valor de x para a posição que ocupa na lista e valor de y para a ordem da lista a que pertence no tabuleiro), devolve o tabuleiro modificado com a peça a ocupar a posição dada
-}
subTab :: [[Peca]] -> Peca -> Posicao -> [[Peca]]
subTab [ ] (Peca a b) (x,y) = [ ]
subTab ((h : t1) : t2) (Peca a b) (x,y)
    |(x >= 0 && y == 0) = ((subLineTab (h : t1) (Peca a b) x) : t2)
    |(x >= 0 && y > 0) = ((h : t1) : (subTab t2 (Peca a b) (x,y-1)))


{-
rodaDir :: Peca -> Peca


rodaEsq :: Peca -> Peca


move :: Posicao -> Orientacao -> Posicao
-}
