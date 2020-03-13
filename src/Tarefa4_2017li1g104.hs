{-|
Module      : Tarefa4_2017li1g104
Description : Módulo da Tarefa 4 para LI1 17/18

Módulo para a realização da Tarefa 4 de LI1 em 2017/18.
-}
module Tarefa4_2017li1g104 where
import Tarefa3_2017li1g104 
import Tarefa2_2017li1g104
import LI11718

{-|
O testes a serem considerados pelo sistema de /feedback/
para a função 'atualiza'.
-}
testesT4 :: [(Tempo,Jogo,Acao)]
testesT4 = [((3.51,Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 2.5, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.5,3.5), direcao = 45.0, velocidade = (1.0,1.0)},Carro {posicao = (3.4,4.4), direcao = 45.0, velocidade = (0.0,0.0)},Carro {posicao = (3.5,1.2), direcao = 45.0, velocidade = (-2.64,-2.1)}], nitros = [5.0,5.0,5.0], historico = [[(2,1)],[(1,3)],[(3,4)]]},Acao {acelerar = True, travar = False, esquerda = True, direita = False, nitro = Nothing})),
           ((3.51,Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 2.5, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.5,3.5), direcao = 45.0, velocidade = (1.0,1.0)},Carro {posicao = (3.4,4.4), direcao = 45.0, velocidade = (0.0,0.0)},Carro {posicao = (3.5,1.2), direcao = 45.0, velocidade = (-2.64,-2.1)}], nitros = [5.0,5.0,5.0], historico = [[(2,1)],[(1,3)],[(3,4)]]},Acao {acelerar = True, travar = True, esquerda = True, direita = False, nitro = Nothing})),
           ((3.51,Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 2.5, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.5,3.5), direcao = 45.0, velocidade = (1.0,1.0)},Carro {posicao = (3.4,4.4), direcao = 45.0, velocidade = (0.0,0.0)},Carro {posicao = (3.5,1.2), direcao = 45.0, velocidade = (-2.64,-2.1)}], nitros = [5.0,5.0,5.0], historico = [[(2,1)],[(1,3)],[(3,4)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = True, nitro = Nothing})),
           ((3.51,Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 2.5, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.5,3.5), direcao = 45.0, velocidade = (1.0,1.0)},Carro {posicao = (3.4,4.4), direcao = 45.0, velocidade = (0.0,0.0)},Carro {posicao = (3.5,1.2), direcao = 45.0, velocidade = (-2.64,-2.1)}], nitros = [5.0,5.0,5.0], historico = [[(2,1)],[(1,3)],[(3,4)]]},Acao {acelerar = False, travar = True, esquerda = False, direita = True, nitro = Nothing})),
           ((3.51,Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 2.5, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.5,3.5), direcao = 45.0, velocidade = (1.0,1.0)},Carro {posicao = (3.4,4.4), direcao = 45.0, velocidade = (0.0,0.0)},Carro {posicao = (3.5,1.2), direcao = 45.0, velocidade = (-2.64,-2.1)}], nitros = [5.0,5.0,5.0], historico = [[(2,1)],[(1,3)],[(3,4)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Just 1}))]


{-|
Função usada para atualizar o estado do jogo dadas as
ações de um jogador num determinado período de tempo.
-}
atualiza :: Tempo -- ^ a duração da ação
         -> Jogo  -- ^ o estado do jogo
         -> Int   -- ^ o identificador do jogador
         -> Acao  -- ^ a ação tomada pelo jogador
         -> Jogo  -- ^ o estado atualizado do jogo

atualiza 0 e j a = e
 --Com nitro
atualiza tac (Jogo{mapa= (Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=(ca:la),nitros=(z:zs),historico=((hi:st):or)}) num (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Just ki})
   |(tn==0) = (Jogo{mapa=(Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=auxSub num 0 aupv (ca:la),nitros=(z:zs),historico=auxSubL num 0 (floor (fst paupv),floor (snd paupv)) ((hi:st):or)})     
   |(ki == num) && (tac>=tn) = (Jogo{mapa=(Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=auxSub num 0 aupv (ca:la),nitros=auxSub num 0 0 (z:zs),historico=auxSubL num 0 (floor (fst paupv),floor (snd paupv)) ((hi:st):or)})
   |(ki == num) && (tac<tn)  = (Jogo{mapa=(Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=auxSub num 0 aupv (ca:la),nitros=auxSub num 0 (tn-tac) (z:zs),historico=auxSubL num 0 (floor (fst paupv),floor (snd paupv)) ((hi:st):or)})
   |(ki /= num) && (tac>=tn) = (Jogo{mapa=(Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=auxSub ki 0 ns (auxSub num 0 aupv (ca:la)),nitros=auxSub num 0 0 (z:zs),historico=auxSubL ki 0 (floor (fst pns),floor (snd pns)) (auxSubL num 0 (floor (fst paupv),floor (snd paupv)) ((hi:st):or))})
   |(ki /= num) && (tac<tn)  = (Jogo{mapa=(Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=auxSub ki 0 ns (auxSub num 0 aupv (ca:la)),nitros=auxSub num 0 (tn-tac) (z:zs),historico=auxSubL ki 0 (floor (fst pns),floor (snd pns)) (auxSubL num 0 (floor (fst paupv),floor (snd paupv)) ((hi:st):or))})
      where tn = auxCarro num (z:zs)
            car = auxCarro num (ca:la)
            car1 = auxCarro ki (ca:la)
            aupv =(Carro{posicao=auxPCarro car,direcao=atualizaDirecao tac car kr (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Just ki}),velocidade=junta}) 
            junta = atualizaVelocidade tac num (Jogo{mapa= (Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=(ca:la),nitros=(z:zs),historico=((hi:st):or)}) (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Just ki})
            paupv = auxPCarro aupv
            ns = (Carro{posicao= auxPCarro car1,direcao=auxDirCarro car1,velocidade=auxNitro tn car1 kn}) 
            pns = auxPCarro ns
--Sem nitro
atualiza tac (Jogo{mapa= (Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=(ca:la),nitros=(z:zs),historico=((hi:st):or)}) num (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Nothing})
   = (Jogo{mapa=(Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=auxSub num 0 aupv (ca:la),nitros=(z:zs),historico=auxSubL num 0 (floor (fst paupv),floor (snd paupv)) ((hi:st):or)}) 

        where junta =(atualizaVelocidade tac num (Jogo{mapa= (Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=(ca:la),nitros=(z:zs),historico=((hi:st):or)}) (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Nothing}))
              car = auxCarro num (ca:la)
              aupv =(Carro{posicao=auxPCarro car,direcao=atualizaDirecao tac car kr (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Nothing}),velocidade=junta}) 
              paupv = auxPCarro aupv
              
{-|
auxDirCarro : funcao que extrai a direcao de um carro
-}
auxDirCarro (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) =dir

auxVCarro (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) = (vx,vy)

{-|
auxPCarro : funcao que extrai a posicao de um carro
-}
auxPCarro (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) =(x,y) 

{-| 
auxCarro : funcao que extrai um carro de uma lista de carros
-}
auxCarro n (h:t) = (!!) (h:t) n

{-|
atualizaVelocidade : funcao que atualiza a velocidade conforme as diferentes forcas
-}
atualizaVelocidade ::Tempo-> Int -> Jogo -> Acao -> (Double,Double)
atualizaVelocidade tac num (Jogo{mapa= (Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=(ca:la),nitros=(z:zs),historico=hst}) (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Just n}) 
        |num==n = aux2V (+) vel (auxCV (*) tac (auxV4 (auxAtrito ac1 ka) (auxPneu ac1 kp) (auxGravidade ac1 m kpe) (auxAcel tac ac1 kace (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Just n})) (auxNitro tn ac1 kn)))
        |otherwise =aux2V (+) vel (auxCV (*) tac (auxV3 (auxAtrito ac1 ka) (auxPneu ac1 kp) (auxGravidade ac1 m kpe) (auxAcel tac ac1 kace (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Just n}))))
                        where vel = auxVCarro (auxCarro num (ca:la))
                              ac1 = auxCarro num (ca:la)
                              tn = auxCarro num (z:zs)

atualizaVelocidade tac num (Jogo{mapa= (Mapa ((x2,y2),o) m),pista=(Propriedades{k_atrito=ka,k_pneus=kp,k_acel=kace,k_peso=kpe,k_nitro=kn,k_roda=kr}),carros=(ca:la),nitros=(z:zs),historico=hst}) (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Nothing})
         = aux2V (+) vel (auxCV (*) tac (auxV3 (auxAtrito ac1 ka) (auxPneu ac1 kp) (auxGravidade ac1 m kpe) (auxAcel tac ac1 kace (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=Nothing}))))
                        where vel = auxVCarro (auxCarro num (ca:la))
                              ac1 = auxCarro num (ca:la)
                              tn = auxCarro num (z:zs)
-- (auxAtrito ac1 ka)
{-|
auxAtrito : funcao que calcula componente do k_atrito
-}
auxAtrito (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) ka = (-ka*vx,-ka*vy)


{-|
auxPneu : funcao que calcula componente do k_pneu
-}
auxPneu (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) kp |a<= 0 && a>= -pi = (cos dir1 * sin (abs a) * kp *mod_v ,sin dir1 * sin (abs a) * kp * mod_v)
                                                                 |a>= 0 && a<= pi = (cos dir2 * sin (abs a) * kp * mod_v,sin dir2 * sin (abs a) * kp * mod_v)

                                                                      where compl_dir = -dir  --definir dir no referencial principal (y para baixo)
                                                                            a = angle (cos ((compl_dir*pi)/180),sin ((compl_dir*pi)/180)) (vx,vy) 
                                                                            dir1 = -(((dir*pi)/180) - (pi/2))
                                                                            dir2 = -(((dir*pi)/180) + (pi/2))
                                                                            mod_v = sqrt(vx^2+vy^2) 

{-|
dot : produto interno de dois vetores
-}
dot (x1,y1) (x2,y2) = x1*x2 + y1*y2      -- dot product between [x1, y1] and [x2, y2]
{-|
det : determinante de dois vetores
-}
det (x1,y1) (x2,y2) = x1*y2 - y1*x2      -- determinant

{-|
angle : angulo entre dois vetores
-}
angle (x1,y1) (x2,y2) = (atan2 (det (x1,y1) (x2,y2)) (dot (x1,y1) (x2,y2)))  -- atan2(y, x) or atan2(sin, cos)




{-|
auxGravidade : funcao que calcula componente do k_peso
-}
auxGravidade :: Carro -> Tabuleiro -> Double  -> (Double,Double)
auxGravidade (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) m kpe  
                                                 |k==(Rampa Norte) = (0,kpe)
                                                 |k==(Rampa Sul)   = (0,-kpe)
                                                 |k==(Rampa Oeste) = ( kpe,0)
                                                 |k==(Rampa Este)  = (-kpe,0) 
                                                 |otherwise = (0,0)
                                                       where      k = auxIndicaTipoPeca (concat m) (posTab1 m (0,0)) (floor x,floor y)
                                                                  

{-|
auxAcel : funcao que calcula componente do k_acel
-}
--Forca de aceleracao
auxAcel tac (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) kace (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=n}) |a==True && w==False = (kace*cos((compl_dir*pi)/180),kace*sin((compl_dir*pi)/180))
                                                                                                                                |w==True && a==False = (-kace*cos((compl_dir*pi)/180),-kace*sin((compl_dir*pi)/180))
                                                                                                                                |otherwise = (0,0)

                                                                                                                                     where compl_dir = -dir  --definir dir no referencial principal (y para baixo)


{-|
auxNitro : funcao que calcula componente do k_nitro
-}
--Atualizar Nitro            
auxNitro tn {-temponitro-} (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) kn |tn==0 = (0,0)
                                                                                    |otherwise = (kn*cos((dir*pi)/180),kn*sin((dir*pi)/180))



{-|
auxV3 : funcao que soma 3 vetores  
-}
auxV3 (x,y) (x1,y1) (x2,y2) (x3,y3) = (x+x1+x2+x3,  y+y1+y2+y3) 

{-|
auxV4 : funcao que soma 4 vetores  
-}
auxV4 (x,y) (x1,y1) (x2,y2) (x3,y3) (x4,y4)= (x+x1+x2+x3+x4,  y+y1+y2+y3+y4)


{-|
atualizaDirecao : funcao que atualiza a direcao 
-} 
atualizaDirecao tac (Carro{posicao=(x,y),direcao=dir,velocidade=(vx,vy)}) kr (Acao{acelerar=a,travar=w,esquerda=e,direita=d,nitro=n})|e==True =dir+ kr*tac
                                                                                                                                     |d==True =(dir - kr*tac) 
                                                                                                                                     |otherwise= dir



{-|
auxSub : funcao que substitui um elemento numa lista  
-}
auxSub n n1 x [] |n==n1 = [x]
                 |otherwise= auxSub n (n1+1) x []   
auxSub n n1 x (h:t) |n==n1 = (x:t)
                    |otherwise= h: auxSub n (n1+1) x t

{-|
auxSubL : funcao que substitui um elemento numa lista de listas  
-}
auxSubL 0 n1 (x,y) [] = [[(x,y)]]
auxSubL n n1 (x,y) [] |n==n1 =[[( x, y)]]
                      |otherwise = [] : auxSubL n (n1+1) ( x, y) []

auxSubL n n1 (x,y) ((h:t):l) | n==n1 && elem (x,y) (concat ((h:t):l)) = ((h:t):l) 
                      |n==n1 = (([( x, y)] ++ [h] ++ t):l)
                      |otherwise = (h:t) : auxSubL n (n1+1) ( x, y) l 




{-|
auxPosVelo : funcao que calcula a posicao,direcao e velocidade de um carro, independentemente de ter caido na lava   
-}
auxPosVelo :: Tabuleiro -> Tempo -> Carro -> Double -> Carro
auxPosVelo m t Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)} r  |r<=0                                                                                                                        = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}  
                                                                    |r==t                                                                                                                        = auxPosVelo m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --Isto não  colide se o carro estiver a ir para outro tabuleiro com altura superior
                                                                    --
                                                                    --A descer - Peça -> Rampa:                                                                                                                     
                                                                    |(k==(Rampa Oeste) ||k==(Rampa Este) || k== (Rampa Norte) || k== (Rampa Sul)) && (k_antigo/= Lava) && a-a_antiga== -1                       = auxPosVelo m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --A subir - Peça -> Rampa:
                                                                    |(k==(Rampa Oeste) ||k==(Rampa Este) || k== (Rampa Norte) || k== (Rampa Sul)) && (k_antigo/= Lava) && a-a_antiga==0                       = auxPosVelo m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --A subir - Rampa -> Peça:
                                                                    |(k/= Lava) && (k_antigo==(Rampa Oeste) ||k_antigo==(Rampa Este) || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a-a_antiga==1                                 = auxPosVelo m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                    --A descer - Rampa -> Peça:
                                                                    |(k/= Lava) && (k_antigo==(Rampa Oeste) ||k_antigo==(Rampa Este) || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a-a_antiga==0                                 = auxPosVelo m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)             
                                                                  --Colisao. Se x<x_antigo, entao n = (1,0)
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a>a_antiga && floor x<floor x_antigo                                                    = auxPosVelo m t Carro{posicao=((x+(fst(vref1))*(dt*2)),(y+(snd(vref1))*(dt*2))),direcao=l,velocidade=(fst vref1,snd vref1)} (r-dt*2)
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Norte) || k_antigo== (Rampa Sul)) && a>a_antiga && floor x>floor x_antigo                                                    = auxPosVelo m t Carro{posicao=((x+(fst(vref2))*(dt*2)),(y+(snd(vref2))*(dt*2))),direcao=l,velocidade=(fst vref2,snd vref2)} (r-dt*2)                
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Este)  || k_antigo== (Rampa Oeste)) && a>a_antiga && floor y<floor y_antigo                                                  = auxPosVelo m t Carro{posicao=((x+(fst(vref3))*(dt*2)),(y+(snd(vref3))*(dt*2))),direcao=l,velocidade=(fst vref3,snd vref3)} (r-dt*2)
                                                                    |(k_antigo==Recta || k_antigo== (Rampa Este)  || k_antigo== (Rampa Oeste)) && a>a_antiga && floor y>floor y_antigo                                                  = auxPosVelo m t Carro{posicao=((x+(fst(vref4))*(dt*2)),(y+(snd(vref4))*(dt*2))),direcao=l,velocidade=(fst vref4,snd vref4)} (r-dt*2)
                                                                    |k== (Curva Norte) && a<0 && y < (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + )1                                = auxPosVelo m t Carro{posicao=((x+(fst(vref5))*(dt*2)),(y+(snd(vref5))*(dt*2))),direcao=l,velocidade=(fst vref5,snd vref5)} (r-dt*2)
                                                                    |k== (Curva Este) && a<0 &&  y < (x - (fromIntegral(floor x)) + (fromIntegral(floor y)))                                     = auxPosVelo m t Carro{posicao=((x+(fst(vref6))*(dt*2)),(y+(snd(vref6))*(dt*2))),direcao=l,velocidade=(fst vref6,snd vref6)} (r-dt*2)
                                                                    |k== (Curva Sul) && a<0 && y > (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                 = auxPosVelo m t Carro{posicao=((x+(fst(vref7))*(dt*2)),(y+(snd(vref7))*(dt*2))),direcao=l,velocidade=(fst vref7,snd vref7)} (r-dt*2)
                                                                    |k== (Curva Oeste) && a<0 && y > (x - (fromIntegral(floor x)) + (fromIntegral (floor y)))                                    = auxPosVelo m t Carro{posicao=((x+(fst(vref8))*(dt*2)),(y+(snd(vref8))*(dt*2))),direcao=l,velocidade=(fst vref8,snd vref8)} (r-dt*2)
                                                                   --Normal
                                                                   --PosicaoMaisBaixa
                                                                    |a<a_antiga = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Norte) && a>0 && y < (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Este) && a>0 &&  y < (x - (fromIntegral(floor x)) + (fromIntegral(floor y)))                                     = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Sul) && a>0 && y > (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                  = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Oeste) && a>0 && y > (x - (fromIntegral(floor x)) + (fromIntegral (floor y)))                                    = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}                  
                                                                  --Se Esta em Lava
                                                                    |k== Lava                                                                                                                   = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Norte) && y < (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + )1                                      = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Sul) && y > (-x + (fromIntegral(floor x)) + (fromIntegral(floor y)) + 1)                                        = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Oeste) && y > (x - (fromIntegral(floor x)  ) + (fromIntegral (floor y)))                                        = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |k== (Curva Este) &&  y < (x - (fromIntegral(floor x)) + (fromIntegral(floor y)))                                           = Carro{posicao=(x,y),direcao=l,velocidade=(vx,vy)}
                                                                    |otherwise = auxPosVelo m t Carro{posicao=(x+vx*dt,y+vy*dt),direcao=l,velocidade=(vx,vy)} (r-dt)
                                                                               
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

