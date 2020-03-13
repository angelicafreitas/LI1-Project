{-|
Module      : Tarefa2_2017li1g104
Description : Módulo correspondente à Tarefa 2

Funções associadas à Tarefa 2 do projeto _Micro-Machines_ de LI1 em 2017/18.
-}
module Tarefa2_2017li1g104 where

import Data.Char
import Data.List
import LI11718


{-|
'testesT2': tabuleiros-modelo para testar a validade do código
-}
testesT2 :: [Tabuleiro]
testesT2 = [[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0, Peca Lava 0, Peca (Rampa Sul) 0, Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1, Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0]],[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0, Peca Lava 0, Peca (Rampa Sul) 0, Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Este) 1, Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0]],[[Peca Lava 1,Peca Lava 1,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0, Peca Lava 0, Peca (Rampa Sul) 0, Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1, Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 1, Peca Lava 0]],[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0, Peca Lava 0, Peca (Rampa Sul) 0, Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1, Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 1, Peca Lava 0]],[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0, Peca Lava 1, Peca (Rampa Sul) 0, Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1, Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0]],[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0, Peca Lava 0, Peca (Rampa Sul) 0, Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 2, Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0]]]


{-|
testar se um dado mapa é ou não ​válido de acordo com um conjunto de regras
-}
valida :: Mapa -> Bool
valida (Mapa (x,o) tabu) = (auxaltLava tabu) && (auxPecaInicialFinal tabu o x) && (auxAlturaCompativel tabu) && (auxMapaRetangular o tabu x) && (auxOrientacao tabu o x) &&(auxPecaVoltaCaminhoLava tabu o x)
  

{-|
'posTab1': dado um tabuleiro e uma posição, a função retorna uma lista com todas as posições, em y (colunas) e x (linhas), do tabuleiro
-}
posTab1 :: Tabuleiro-> (Int,Int) -> [(Int,Int)]
posTab1 [] (y,x)         = []
posTab1 ((h:t):xs) (y,x) = posLinha (h:t) (y,x) ++ posTab1 xs (y,x+1)


{-|
'posLinha': dada uma lista de peças (linha) e uma posição, retorna uma lista com todas as posições dessa linha
-}
posLinha :: [Peca] -> (Int,Int) -> [(Int,Int)]
posLinha [] (y,x)    = []
posLinha (h:t) (y,x) = (y,x) : posLinha t (y+1,x)


{-|
'auxaltLava': a função verifica se é ou não verdade que a altura da lava é 0
-}
auxaltLava :: Tabuleiro -> Bool
auxaltLava ((Peca Lava e:z):t)   |e== 0 = auxaltLava (z:t)
                                 |otherwise = False
auxaltLava _              = True


{-|
'auxPecaInicialFinal': dado um tabuleiro, uma orientação e uma posição, a função verifica se a peça inicial e a final são as mesmas e se a orientação final e a inicial também são as mesmas
-}
auxPecaInicialFinal :: Tabuleiro -> Orientacao -> (Int,Int) -> Bool
auxPecaInicialFinal tabu ori x = if  snd (auxOrientacaoPosicao tabu (posTab1 tabu (0,0)) ori x)==x && fst(auxOrientacaoPosicao tabu (posTab1 tabu (0,0)) ori x)==ori then True
                                           else False

{-|
'auxOrientacaoPosicao': dado um tabuleiro, uma lista de posições, uma orientação e uma posição, calcula a orientação final e as posições finais
-}
auxOrientacaoPosicao :: Tabuleiro -> [(Int,Int)]-> Orientacao -> (Int,Int) -> (Orientacao,(Int,Int))
auxOrientacaoPosicao ttab [] o (r,l) = (o,(r,l))
auxOrientacaoPosicao ttab (h:s) o (x,y)           |o==Este   && t1== (Recta)                 = auxOrientacaoPosicao ttab s Este  (x+1,y)
                                                  |o==Este   && t1== (Curva Este)            = auxOrientacaoPosicao ttab s Sul   (x,y+1)
                                                  |o==Este   && t1== (Curva Sul)             = auxOrientacaoPosicao ttab s Norte (x,y-1)
                                                  |o== Este  && t1==(Rampa Este)             = auxOrientacaoPosicao ttab s Este  (x+1,y)
                                                  |o== Este  && t1==(Rampa Oeste)            = auxOrientacaoPosicao ttab s Este  (x+1,y)
                                                  |o== Oeste && t1==(Recta)                  = auxOrientacaoPosicao ttab s Oeste (x-1,y)
                                                  |o== Oeste && t1==(Curva Oeste)            = auxOrientacaoPosicao ttab s Norte (x,y-1)
                                                  |o== Oeste && t1==(Curva Norte)            = auxOrientacaoPosicao ttab s Sul   (x,y+1)
                                                  |o== Oeste &&  t1==(Rampa Oeste)           = auxOrientacaoPosicao ttab s Oeste (x-1,y)
                                                  |o== Oeste &&  t1==(Rampa Este)            = auxOrientacaoPosicao ttab s Oeste (x-1,y)
                                                  |o== Norte && t1==(Recta)                  = auxOrientacaoPosicao ttab s Norte (x,y-1)
                                                  |o== Norte && t1==(Curva Norte)            = auxOrientacaoPosicao ttab s Este  (x+1,y)
                                                  |o== Norte && t1==(Curva Este)             = auxOrientacaoPosicao ttab s Oeste (x-1,y)
                                                  |o== Norte &&  t1==(Rampa Norte)           = auxOrientacaoPosicao ttab s Norte (x,y-1)
                                                  |o== Norte &&  t1==(Rampa Sul)             = auxOrientacaoPosicao ttab s Norte (x,y-1)
                                                  |o== Sul   && t1==(Recta)                  = auxOrientacaoPosicao ttab s Sul   (x,y+1)
                                                  |o== Sul   && t1==(Curva Sul)              = auxOrientacaoPosicao ttab s Oeste (x-1,y)
                                                  |o== Sul   && t1==(Curva Oeste)            = auxOrientacaoPosicao ttab s Este  (x+1,y)
                                                  |o== Sul   &&  t1==(Rampa Sul)             = auxOrientacaoPosicao ttab s Sul   (x,y+1)
                                                  |o== Sul   &&  t1==(Rampa Norte)           = auxOrientacaoPosicao ttab s Sul   (x,y+1)
                                                  |otherwise = auxOrientacaoPosicao ttab s o (x,y)                   
                                                       where t1 = auxIndicaTipoPeca (concat ttab) (posTab1 ttab (0,0)) (x,y)



{-|
'auxAlturaCompativel': dado um tabuleiro, verifica se a altura da primeira peça que o constitui é compatível com a altura das peças seguintes
-}
auxAlturaCompativel :: Tabuleiro -> Bool
auxAlturaCompativel ((Peca t a : Peca t1 a1 :l):p) 
                                                    |t==Rampa Norte && (a1-a)== 0 = False
                                                    |t==Rampa Sul && (a1-a)== 0 = False
                                                    |t1==Rampa Norte && (a1-a)== 0 = False
                                                    |t1==Rampa Sul && (a1-a)== 0 = False
                                                    |(t/=Rampa Sul && t/= Rampa Norte) && (a1-a)/=0 = False
                                                    |otherwise = auxAlturaCompativel ((Peca t1 a1 :l):p)
auxAlturaCompativel _  =True


{-|
'auxMapaRetangular': verifica se as peças que estão na primeira e na última linha e na primeira coluna e na segunda coluna
-}
auxMapaRetangular ::Orientacao -> Tabuleiro -> (Int,Int)-> Bool
auxMapaRetangular o tabul x |auxRetirarElemento (Peca Lava 0) g == [] = True
                             |otherwise                        = False 
                                where g = auxPecasMoldura (concat tabul) (posTab1 tabul (0,0)) x


{-|
'auxRetirarElemento': função que retira todas as ocorrências de um dado elemento numa lista
-}
auxRetirarElemento :: (Eq a) => a ->[a] -> [a]
auxRetirarElemento x []     = []
auxRetirarElemento x (y:ys) | x==y = auxRetirarElemento x ys
                            |otherwise =y: auxRetirarElemento x ys



{-|
'auxPosicaoMoldura': função que retorna uma lista com as posições da primeira linha e coluna e da última linha e coluna
-}
auxPosicaoMoldura :: [Peca] ->[(Int,Int)]-> (Int,Int)-> [(Int,Int)]
auxPosicaoMoldura [d] [e] (y1,x1) =[e]
auxPosicaoMoldura (Peca t a :d) ((y,x):e) (y1,x1) | y==0 || x==0 = (y,x): auxPosicaoMoldura d e (y1,x1)
                                                  | x== (snd (last e)) || y ==(snd (last e)) = (y,x): auxPosicaoMoldura d e (y1,x1)
                                                  |otherwise = auxPosicaoMoldura d e (y1,x1)

auxPosicaoMoldura _ _ _ = []


{-|
'auxPecasMoldura': retorna a lista de peças da primeira e última colunas e primeira e última linhas
-}
auxPecasMoldura :: [Peca] ->[(Int,Int)]-> (Int,Int)-> [Peca]
auxPecasMoldura [d] [e] (y1,x1) = [d]
auxPecasMoldura (Peca t a :d) ((x,y):e) (y1,x1) | y==0 || x==0 || x== (fst (last e)) || y ==(snd (last e)) = Peca t a : auxPecasMoldura d e (y1,x1)
                                               |otherwise = auxPecasMoldura d e (y1,x1)
auxPecasMoldura _ _ _ = []


{-|
'auxPecaVoltaCaminhoLava': verifica se as peças que não fazem parte do caminho são do tipo lava
-}
auxPecaVoltaCaminhoLava :: Tabuleiro ->Orientacao -> (Int,Int) -> Bool
auxPecaVoltaCaminhoLava tab o r |auxRetirarElemento (Peca Lava 0) (auxTiraCaminho (concat tab)) ==[] = True
                                |otherwise = False

{-|
'auxPecasSemMoldura': pecas sem a primeira colunas e linha e ultima linha e coluna
-}
auxPecasSemMoldura :: [Peca] ->[(Int,Int)]-> (Int,Int)-> [Peca]
auxPecasSemMoldura [d] [e] (y1,x1) =[]
auxPecasSemMoldura (Peca t a :d) ((y,x):e) (y1,x1) |y==0 = auxPecasSemMoldura d e (y1,x1)
                                     | x==0 = auxPecasSemMoldura d e (y1,x1)
                                     | x== (snd (last e)) = auxPecasSemMoldura d e (y1,x1)
                                     | y ==(snd (last e)) = auxPecasSemMoldura d e (y1,x1)
                                     |otherwise = Peca t a :auxPecasSemMoldura d e (y1,x1)
auxPecasSemMoldura _ _ _ = []


{-|
'auxPosicoesSemMoldura': posicoes sem a primeira coluna e linha e ultima linha e coluna
-}
auxPosicoesSemMoldura :: [Peca] ->[(Int,Int)]-> (Int,Int)-> [(Int,Int)]
auxPosicoesSemMoldura [d] [e] (y1,x1) =[]
auxPosicoesSemMoldura (Peca t a :d) ((y,x):e) (y1,x1) | y==0 || x==0 = auxPosicoesSemMoldura d e (y1,x1)
                                                      | x== (snd (last e)) || y ==(snd (last e)) = auxPosicoesSemMoldura d e (y1,x1)
                                                      |otherwise = (y,x) :auxPosicoesSemMoldura d e (y1,x1)

auxPosicoesSemMoldura _ _ _ = []


{-|
'auxPosicaoCaminho': dado um tabuleiro, retorna as posições do caminho
-}
auxPosicaoCaminho :: Tabuleiro -> [(Int,Int)]-> Orientacao -> (Int,Int) -> (Int,Int) -> Int -> [(Int,Int)]
auxPosicaoCaminho ttab [] o (r,l) (x1,y1) a = []
auxPosicaoCaminho ttab [x] o (r,l) (x1,y1) a = [(r,l)]
auxPosicaoCaminho ttab (h:s) o (x,y) (x1,y1) 1 | x1 == x && y1 == y = [(x,y)]
auxPosicaoCaminho ttab (h:s) o (x,y) (x1,y1) 0    |o== Este && t1== (Recta)                = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Este && t1== (Curva Este)           = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Este && t1== (Curva Sul)            = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Este  && t1==(Rampa Este)           = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Este  && t1==(Rampa Oeste)          = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Oeste && t1==Recta                  = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Oeste && t1==(Curva Oeste)          = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Oeste && t1==(Curva Norte)          = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Oeste &&  t1==(Rampa Oeste)         = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Oeste &&  t1==(Rampa Este)          = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Norte && t1==Recta                  = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Norte && t1==(Curva Norte)          = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Norte && t1==(Curva Este)           = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Norte &&  t1==(Rampa Norte)         = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Norte &&  t1==(Rampa Sul)           = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Sul   && t1==Recta                  = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Sul   && t1==(Curva Sul)            = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Sul   && t1==(Curva Oeste)          = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Sul   &&  t1==(Rampa Sul)           = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Sul   &&  t1==(Rampa Norte)         = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |otherwise                               = auxPosicaoCaminho ttab s o (x,y) (x1,y1) 1
                                                       where t1 = auxIndicaTipoPeca (concat ttab) (posTab1 ttab (0,0)) (x, y)
                                                        --auxIndicaTipoPeca (auxPecasSemMoldura (concat ttab) (posTab1 ttab (0,0)) (x,y)) (auxPosicoesSemMoldura (concat ttab) (posTab1 ttab (0,0)) (x,y)) (x,y)
                                                            --      auxIndicaTipoPeca (concat ttab) (posTab1 ttab (0,0)) (x, y)

auxPosicaoCaminho ttab (h:s) o (x,y)  (x1,y1) 1   |o== Este && t1== (Recta)                = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Este && t1== (Curva Este)           = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Este && t1== (Curva Sul)            = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Este  && t1==(Rampa Este)           = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Este  && t1==(Rampa Oeste)          = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Oeste && t1==Recta                  = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Oeste && t1==(Curva Oeste)          = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Oeste && t1==(Curva Norte)          = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Oeste &&  t1==(Rampa Oeste)         = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Oeste &&  t1==(Rampa Este)          = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Norte && t1==Recta                  = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Norte && t1==(Curva Norte)          = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Norte && t1==(Curva Este)           = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Norte &&  t1==(Rampa Norte)         = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Norte &&  t1==(Rampa Sul)           = (x,y):auxPosicaoCaminho ttab s Norte (x,y-1) (x1,y1) 1
                                                  |o== Sul   && t1==Recta                  = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Sul   && t1==(Curva Sul)            = (x,y):auxPosicaoCaminho ttab s Oeste (x-1,y) (x1,y1) 1
                                                  |o== Sul   && t1==(Curva Oeste)          = (x,y):auxPosicaoCaminho ttab s Este  (x+1,y) (x1,y1) 1
                                                  |o== Sul   &&  t1==(Rampa Sul)           = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |o== Sul   &&  t1==(Rampa Norte)         = (x,y):auxPosicaoCaminho ttab s Sul   (x,y+1) (x1,y1) 1
                                                  |otherwise                               = auxPosicaoCaminho ttab s o (x,y) (x1,y1) 1
                                                       where t1 = auxIndicaTipoPeca (concat ttab) (posTab1 ttab (0,0)) (x, y)
                                                        --auxIndicaTipoPeca (auxPecasSemMoldura (concat  ttab) (posTab1 ttab (0,0)) (x,y)) (auxPosicoesSemMoldura (concat ttab) (posTab1 ttab (0,0)) (x,y)) (x,y)


{-|
'auxIndicaTipoPeca': retorna o tipo de peca do caminho
-}
auxIndicaTipoPeca :: [Peca] ->[(Int,Int)]-> (Int,Int) -> Tipo 
auxIndicaTipoPeca [Peca t a] _ _ = t                       
auxIndicaTipoPeca (Peca t a :p) (h:hs) (y,x) | h==(y,x) = t 
                                             |otherwise = auxIndicaTipoPeca p hs (y,x)



{-|
'auxTiraCaminho': retorna a lista de peças sem as posições do caminho
-}
auxTiraCaminho ::[Peca] -> [Peca] 
auxTiraCaminho (Peca t a :d) |t==Lava = Peca t a : auxTiraCaminho d
                             |otherwise = auxTiraCaminho d 
auxTiraCaminho _  =[]     

                                                               
{-|
'sort1': ordena as posições conforme uma matriz
-}
sort1 :: [(Int,Int)] -> [(Int,Int)]
sort1 a = sort2 a (length(a))


{-|
'sort2': coloca as posições numa lista por ordem, conforme uma matriz
-}
sort2 :: [(Int,Int)] -> Int -> [(Int,Int)]
sort2 a 0 = a
sort2 ((a,b):[]) z = [(a,b)]
sort2 ((a,b):(c,d):t) z | b>d = sort2 ((c,d):(sort2 ((a,b):t) z)) (z-1)
                        |b==d && a>c = sort2 ((c,d):(sort2 ((a,b):t) z)) (z-1)
                        | otherwise = sort2 ((a,b):(sort2 ((c,d):t) z)) (z-1)




{-|
'auxOrientacao': dado um tabuleiro, verifica se a orientação inicial é válida
-}
auxOrientacao :: Tabuleiro -> Orientacao-> (Int,Int) -> Bool
auxOrientacao tabulei o (y,x)     |o==Este               && (t== (Curva Norte)||t==(Curva Oeste)) =False
                                  |o==Oeste              && (t== (Curva Sul) ||t==(Curva Este)) = False
                                  |o==Norte              && (t== (Curva Sul) || t==(Curva Oeste)) =False
                                  |o==Sul                && (t== (Curva Norte) || t== (Curva Este)) = False
                                  |(o==Este||o==Oeste)   && (t==(Rampa Sul)||t==(Rampa Norte)) = False
                                  |(o==Sul||o==Norte)    && (t==(Rampa Este)||t==(Rampa Oeste)) = False
                                  |otherwise = True
                                         where t= auxIndicaTipoPeca (concat tabulei) (posTab1 tabulei (0,0)) (y,x)
 


rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs)   | x `elem` xs   = rmdups xs
                | otherwise     = x : rmdups xs
