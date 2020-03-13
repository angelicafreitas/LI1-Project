{-|
Module      : Tarefa3_2017li1g104
Description : Módulo correspondente à Tarefa 3

Funções associadas à Tarefa 3 do projeto _Micro-Machines_ de LI1 em 2017/18.
-}
module Tarefa3_2017li1g104 where
import Tarefa2_2017li1g104
import Data.List
import Data.Char
import LI11718

--[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Oeste) 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,]]

{-|
'testesT3': situações-modelo para testar a validade do código
-}
testesT3 :: [(Tabuleiro,Tempo,Carro)]
testesT3 = [(t5,1.2,Carro{posicao=(5.0,3.0),direcao=40.0,velocidade=(1.0,1.0)}),(t21,1.8,Carro{posicao=(3.0,5.0),direcao=24.0,velocidade=(1.5,1.5)}),(t22,2.0,Carro{posicao=(7.0,2.0),direcao=45.0,velocidade=(3.0,3.0)})]
t22,t21,t5 :: Tabuleiro
t22 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1), Peca Lava 0, Peca (Rampa Norte) (-1), Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1), Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0]]
t21 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Oeste) 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
t5 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-1),Peca Recta (-1),Peca (Curva Este) (-1),Peca Lava 0],[Peca Lava 0,Peca (Recta) (-1), Peca Lava 0, Peca Recta (-1), Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1), Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0]]
{-|
dt : incremento do tempo (step)
-}
dt = 0.0001

{-|
'movimenta': recebe um tabuleiro, um período de tempo e um carro e calcula o novo estado do carro após se ter movimentado durante o período de tempo dado
-}
movimenta :: Tabuleiro -> Tempo -> Carro -> Maybe Carro
movimenta m t Carro{posicao=(x,y),direcao=l,velocidade=(v1,v2)} = auxJunta m t Carro{posicao=(x,y),direcao=l,velocidade=(v1,v2)} t
                                                                

{-|
auxJunta : funcao que determina se o apos um tempo o carro é destruído ou entao determina as suas caracteristicas
-}
auxJunta :: Tabuleiro -> Tempo -> Carro -> Double -> Maybe Carro
auxJunta m t Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)} r    |r<=0                                                                                                                        = Just Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}  
                                                                    |r==t                                                                                                                        = auxJunta m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --Isto não  colide se o carro estiver a ir para outro tabuleiro com altura superior
                                                                    --
                                                                    --A descer - Peça -> Rampa:                                                                                                                     
                                                                    |(k==(Rampa Oeste) ||k==(Rampa Este) || k== (Rampa Norte) || k== (Rampa Sul)) && (k_antigo/= Lava) && a-a_antiga== -1                       = auxJunta m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --A subir - Peça -> Rampa:
                                                                    |(k==(Rampa Oeste) ||k==(Rampa Este) || k== (Rampa Norte) || k== (Rampa Sul)) && (k_antigo/= Lava) && a-a_antiga==0                       = auxJunta m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --A subir - Rampa -> Peça:
                                                                    |(k/= Lava) && (k_antigo==(Rampa Oeste) ||k_antigo==(Rampa Este) || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a-a_antiga==1                                 = auxJunta m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --A descer - Rampa -> Peça:
                                                                    |(k/= Lava) && (k_antigo==(Rampa Oeste) ||k_antigo==(Rampa Este) || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a-a_antiga==0                                 = auxJunta m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)             
                                                                  --Colisao. Se x<x_antigo, entao n = (1,0)
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a>a_antiga && floor x<floor x_antigo                                                    = auxJunta m t Carro{posicao=((x+(fst(vref1))*(dt*2)),(y+(snd(vref1))*(dt*2))),direcao=l,velocidade=(fst vref1,snd vref1)} (r-dt*2)
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a>a_antiga && floor x>floor x_antigo                                                    = auxJunta m t Carro{posicao=((x+(fst(vref2))*(dt*2)),(y+(snd(vref2))*(dt*2))),direcao=l,velocidade=(fst vref2,snd vref2)} (r-dt*2)                
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Este)  || k_antigo== (Rampa Oeste)) && a>a_antiga && floor y<floor y_antigo                                                  = auxJunta m t Carro{posicao=((x+(fst(vref3))*(dt*2)),(y+(snd(vref3))*(dt*2))),direcao=l,velocidade=(fst vref3,snd vref3)} (r-dt*2)
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Este)  || k_antigo== (Rampa Oeste)) && a>a_antiga && floor y>floor y_antigo                                                  = auxJunta m t Carro{posicao=((x+(fst(vref4))*(dt*2)),(y+(snd(vref4))*(dt*2))),direcao=l,velocidade=(fst vref4,snd vref4)} (r-dt*2)
                                                                    |k== (Curva Norte) && a<0 && y < (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + )1                                = auxJunta m t Carro{posicao=((x+(fst(vref5))*(dt*2)),(y+(snd(vref5))*(dt*2))),direcao=l,velocidade=(fst vref5,snd vref5)} (r-dt*2)
                                                                    |k== (Curva Este) && a<0 &&  y < (x - (fromIntegral(floor x)) + (fromIntegral(floor y)))                                     = auxJunta m t Carro{posicao=((x+(fst(vref6))*(dt*2)),(y+(snd(vref6))*(dt*2))),direcao=l,velocidade=(fst vref6,snd vref6)} (r-dt*2)
                                                                    |k== (Curva Sul) && a<0 && y > (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                 = auxJunta m t Carro{posicao=((x+(fst(vref7))*(dt*2)),(y+(snd(vref7))*(dt*2))),direcao=l,velocidade=(fst vref7,snd vref7)} (r-dt*2)
                                                                    |k== (Curva Oeste) && a<0 && y > (x - (fromIntegral(floor x)) + (fromIntegral (floor y)))                                    = auxJunta m t Carro{posicao=((x+(fst(vref8))*(dt*2)),(y+(snd(vref8))*(dt*2))),direcao=l,velocidade=(fst vref8,snd vref8)} (r-dt*2)
                                                                   --Normal
                                                                   --PosicaoMaisBaixa
                                                                    |a<a_antiga = Nothing
                                                                    |k== (Curva Norte) && a>0 && y < (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                = Nothing
                                                                    |k== (Curva Este) && a>0 &&  y < (x - (fromIntegral(floor x)) + (fromIntegral(floor y)))                                     = Nothing
                                                                    |k== (Curva Sul) && a>0 && y > (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                  = Nothing
                                                                    |k== (Curva Oeste) && a>0 && y > (x - (fromIntegral(floor x)) + (fromIntegral (floor y)))                                    = Nothing                                                            
                                                                  --Se Esta em Lava
                                                                    |k== Lava                                                                                                                   = Nothing
                                                                    |k== (Curva Norte) && y < (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + )1                                      = Nothing
                                                                    |k== (Curva Sul) && y > (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                        = Nothing
                                                                    |k== (Curva Oeste) && y > (x - (fromIntegral(floor x)  ) + (fromIntegral (floor y)))                                        = Nothing
                                                                    |k== (Curva Este) &&  y < (x - (fromIntegral(floor x)) + (fromIntegral(floor y)))                                           = Nothing
                                                                    |otherwise = auxJunta m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                               
                                                                                 where  
                                                                                        a = auxIndicaAltPeca (concat m) (posTab1 m (0,0)) (floor x,floor y)
                                                                                        a_antiga = auxIndicaAltPeca (concat m) (posTab1 m (0,0)) (floor x_antigo,floor y_antigo)
                                                                                        k  = auxIndicaTipoPeca (concat m) (posTab1 m (0,0)) (floor x,floor y)       
                                                                                        k_antigo = auxIndicaTipoPeca (concat m) (posTab1 m (0,0)) ((floor x_antigo), (floor y_antigo))
                                                                                        vref1 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) (1,0) (vx,vy)))) (1,0))
                                                                                        vref2 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) (-1,0) (vx,vy)))) (-1,0))
                                                                                        vref3 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) (0,1) (vx,vy)))) (0,1))
                                                                                        vref4 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) (0,-1) (vx,vy)))) (0,-1))
                                                                                        vref5 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) ((sqrt 2)/2,(sqrt 2)/2) (vx,vy)))) ((sqrt 2)/2,(sqrt 2)/2))
                                                                                        vref6 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) (-(sqrt 2)/2,(sqrt 2)/2) (vx,vy)))) (-(sqrt 2)/2,(sqrt 2)/2))
                                                                                        vref7 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) (-(sqrt 2)/2,-(sqrt 2)/2) (vx,vy)))) (-(sqrt 2)/2,-(sqrt 2)/2))
                                                                                        vref8 = aux2V (-) (vx,vy) (auxCV (*) (2*(auxV (+) (aux2V (*) ((sqrt 2)/2,-(sqrt 2)/2) (vx,vy)))) ((sqrt 2)/2,-(sqrt 2)/2))                                                                                        
                                                                                        x_antigo = x-(vx*dt)
                                                                                        y_antigo = y-(vy*dt)

{-|
aux2V : funcao que realiza uma operacao a dois vetores
-}
aux2V f (x,y) (s,d) =(f x s, f y d)

{-|
auxCV : funcao que realiza uma operacao a uma constante e um vetor
-}
auxCV f x (s,d) = (f x s,f x d)  

{-|
auxV : funcao que realiza uma operacao a um vetor
-}
auxV f (x,y) =f x y 
 


{-|
'auxIndicaAltPeca': função que, dada uma lista de peças e as posições dessa lista de peças extrai a altura duma peça numa posição
-}
auxIndicaAltPeca :: [Peca] ->[(Int,Int)]-> (Int,Int) -> Altura 
auxIndicaAltPeca [Peca t a] _ _ = a                       
auxIndicaAltPeca (Peca t a :p) (h:hs) (x,y) |h==(x,y) = a 
                                            |otherwise = auxIndicaAltPeca p hs (x,y)



