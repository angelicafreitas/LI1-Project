{-|
Module      : Tarefa6_2017li1g104
Description : Módulo da Tarefa 6 para LI1 17/18

Módulo para a realização da Tarefa 6 de LI1 em 2017/18.
-}
module Tarefa6_2017li1g104 where
import Tarefa3_2017li1g104
import Tarefa4_2017li1g104
import Tarefa2_2017li1g104
import Mapas
import LI11718


{-|
Função usada para simular um /bot/ no jogo /Micro Machines/.
Em cada instante, dado o tempo decorrido, o estado do jogo
e o identificador do jogador, toma uma ação.
-}
bot :: Tempo  -- ^ tempo decorrido desde a última decisão
    -> Jogo   -- ^ estado atual do jogo
    -> Int    -- ^ identificador do jogador dentro do estado
    -> Acao   -- ^ a decisão tomada pelo /bot/
                                                                                                            --Seq: Reta/Rampa -> Reta/Rampa -> Reta/Rampa (colocar nitro)
bot tick Jogo{mapa=(Mapa ((xi,yi),o) m),pista=p,carros=(ca:la),nitros=(z:zs),historico=((hi:st):or)} num    |dif_prox_x>0 && (sin dir_rad<0 && cos dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Just num}
                                                                                                            |dif_prox_x>0 && (sin dir_rad>=0 && cos dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Just num}

                                                                                                            |dif_prox_x<0 && (sin dir_rad>0 && cos dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Just num}
                                                                                                            |dif_prox_x<0 && (sin dir_rad<=0 && cos dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Just num}

                                                                                                            |dif_prox_y>0 && (cos dir_rad<0 && sin dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Just num}
                                                                                                            |dif_prox_y>0 && (cos dir_rad>=0 && sin dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Just num}

                                                                                                            |dif_prox_y<0 && (cos dir_rad>0 && sin dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Just num}
                                                                                                            |dif_prox_y<0 && (cos dir_rad<=0 && sin dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Just num}


                                                                                                            --Seq: Rampa -> Rampa (colocar nitro)
                                                                                                            --
                                                                                                            --Direção na HORIZONTAL (dif_prox_x diferente de zero)
                                                                                                            --
                                                                                                            --Da esq para a direita
                                                                                                            |dif_prox_x>0 && (sin dir_rad<0 && cos dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin dir_rad>=0 && cos dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Da direita para a esq
                                                                                                            |dif_prox_x<0 && (sin dir_rad>0 && cos dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin dir_rad<=0 && cos dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --
                                                                                                            --Direção na VERTICAL (dif_prox_y diferente de zero)
                                                                                                            --
                                                                                                            --De cima para baixo
                                                                                                            |dif_prox_y>0 && (cos dir_rad<0 && sin dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos dir_rad>=0 && sin dir_rad> -0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Da baixo para cima
                                                                                                            |dif_prox_y<0 && (cos dir_rad>0 && sin dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos dir_rad<=0 && sin dir_rad< 0.997) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este) && k/=Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este) && k/=Recta) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            
                                                                                                            


                                                                                                            --
                                                                                                            --Seq: Reta -> Reta/Rampa
                                                                                                            --
                                                                                                            --Direção na HORIZONTAL (dif_prox_x diferente de zero)
                                                                                                            --
                                                                                                            --Da esq para a direita
                                                                                                            |dif_prox_x>0 && (sin dir_rad<0 && cos dir_rad< 0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin dir_rad>=0 && cos dir_rad< 0.997) && (k==Recta) && (k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Da direita para a esq
                                                                                                            |dif_prox_x<0 && (sin dir_rad>0 && cos dir_rad> -0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin dir_rad<=0 && cos dir_rad> -0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --
                                                                                                            --Direção na VERTICAL (dif_prox_y diferente de zero)
                                                                                                            --
                                                                                                            --De cima para baixo
                                                                                                            |dif_prox_y>0 && (cos dir_rad<0 && sin dir_rad> -0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos dir_rad>=0 && sin dir_rad> -0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Da baixo para cima
                                                                                                            |dif_prox_y<0 && (cos dir_rad>0 && sin dir_rad< 0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos dir_rad<=0 && sin dir_rad< 0.997) && (k==Recta) && (proxima_peca/=(Curva Norte) && proxima_peca/=(Curva Sul) && proxima_peca/=(Curva Oeste) && proxima_peca/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            

                                                                                                            --Seq: Reta/Rampa -> CURVA -> Reta/Rampa
                                                                                                            --
                                                                                                             --CURVA ESTE
                                                                                                             --
                                                                                                             -- Carro anda no sentido dos ponteiros do relogio (dif>0)
                                                                                                             -- 1a linha: Carro roda pela esquerda, enquanto direção for diferente da pretendida
                                                                                                             -- 2a linha: Carro roda pela direita
                                                                                                            |dif>0 && x > realToFrac (floor x) + 0.7 && (cos dir_rad<0 && sin dir_rad> -0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Este) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif>0 && x > realToFrac (floor x) + 0.7 && (cos dir_rad>=0 && sin dir_rad> -0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Este) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                             -- Carro anda no sentido contrário (dif<0)
                                                                                                            |dif<0 && y < realToFrac (floor y) + 0.3 && (sin dir_rad>=0 && cos dir_rad> -0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Este) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif<0 && y < realToFrac (floor y) + 0.3 && (sin dir_rad<0 && cos dir_rad> -0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Este) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                             
                                                                                                             --CURVA SUL
                                                                                                            |dif>0 && y > realToFrac (floor y) + 0.7 && (sin dir_rad>=0 && cos dir_rad> -0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Sul) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif>0 && y > realToFrac (floor y) + 0.7 && (sin dir_rad<0 && cos dir_rad> -0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Sul) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            |dif<0 && x > realToFrac (floor x) + 0.7 && (cos dir_rad>=0 && sin dir_rad< 0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Sul) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif<0 && x > realToFrac (floor x) + 0.7 && (cos dir_rad<0 && sin dir_rad< 0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Sul) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                             
                                                                                                             --CURVA OESTE
                                                                                                            |dif<0 && x < realToFrac (floor x) + 0.3 && (cos dir_rad>=0 && sin dir_rad< 0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Oeste) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif<0 && x < realToFrac (floor x) + 0.3 && (cos dir_rad<0 && sin dir_rad< 0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Oeste) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            |dif>0 && y > realToFrac (floor y) + 0.7 && (sin dir_rad<=0 && cos dir_rad< 0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Oeste) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif>0 && y > realToFrac (floor y) + 0.7 && (sin dir_rad>0 && cos dir_rad< 0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Oeste) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                             --CURVA NORTE
                                                                                                            |dif<0 && y < realToFrac (floor y) + 0.3 && (sin dir_rad<=0 && cos dir_rad< 0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Norte) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif<0 && y < realToFrac (floor y) + 0.3 && (sin dir_rad>0 && cos dir_rad< 0.997) && (k==Recta || k==Rampa Norte || k==Rampa Sul) && proxima_peca==(Curva Norte) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            |dif>0 && x < realToFrac (floor x) + 0.3 && (cos dir_rad<0 && sin dir_rad> -0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Norte) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif>0 && x < realToFrac (floor x) + 0.3 && (cos dir_rad>=0 && sin dir_rad> -0.997) && (k==Recta || k==Rampa Oeste || k==Rampa Este) && proxima_peca==(Curva Norte) && (proxima_peca1/=(Curva Norte) && proxima_peca1/=(Curva Sul) && proxima_peca1/=(Curva Oeste) && proxima_peca1/=(Curva Este)) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}


                                                                                                             --Seq: Curva -> Reta/Rampa
                                                                                                             --
                                                                                                             --CURVA ESTE
                                                                                                            |dif_prox_y>0 && (cos dir_rad<=0 && sin dir_rad> -0.997) && (k==Curva Este) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos dir_rad>0 && sin dir_rad> -0.997) && (k==Curva Este) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                             -- o carro está a andar no sentido contrário
                                                                                                            |dif_prox_x<0 && (sin dir_rad>=0 && cos dir_rad> -0.997) && (k==Curva Este) && (proxima_peca==Recta || proxima_peca==Rampa Este || proxima_peca==Rampa Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin dir_rad<0 && cos dir_rad> -0.997) && (k==Curva Este) && (proxima_peca==Recta || proxima_peca==Rampa Este || proxima_peca==Rampa Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                             

                                                                                                             --CURVA SUL
                                                                                                            |dif_prox_x<0 && (sin dir_rad>0 && cos dir_rad> -0.997) && (k==Curva Sul) && (proxima_peca==Recta || proxima_peca==Rampa Oeste || proxima_peca==Rampa Este) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin dir_rad<=0 && cos dir_rad> -0.997) && (k==Curva Sul) && (proxima_peca==Recta || proxima_peca==Rampa Oeste || proxima_peca==Rampa Este) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            |dif_prox_y<0 && (cos dir_rad>0 && sin dir_rad< 0.997) && (k==Curva Sul) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos dir_rad<=0 && sin dir_rad< 0.997) && (k==Curva Sul) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}


                                                                                                             --CURVA OESTE
                                                                                                            |dif_prox_y<0 && (cos dir_rad>0 && sin dir_rad< 0.997) && (k==Curva Oeste) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos dir_rad<=0 && sin dir_rad< 0.997) && (k==Curva Oeste) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            |dif_prox_x>0 && (sin dir_rad<0 && cos dir_rad< 0.997) && (k==Curva Oeste) && (proxima_peca==Recta || proxima_peca==Rampa Este || proxima_peca==Rampa Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin dir_rad>=0 && cos dir_rad< 0.997) && (k==Curva Oeste) && (proxima_peca==Recta || proxima_peca==Rampa Este || proxima_peca==Rampa Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}


                                                                                                             --CURVA NORTE
                                                                                                            |dif_prox_x>0 && (sin dir_rad<0 && cos dir_rad< 0.997) && (k==Curva Norte) && (proxima_peca==Recta || proxima_peca==Rampa Este || proxima_peca==Rampa Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin dir_rad>=0 && cos dir_rad< 0.997) && (k==Curva Norte) && (proxima_peca==Recta || proxima_peca==Rampa Este || proxima_peca==Rampa Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            |dif_prox_y>0 && (cos dir_rad<0 && sin dir_rad> -0.997) && (k==Curva Norte) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos dir_rad>=0 && sin dir_rad> -0.997) && (k==Curva Norte) && (proxima_peca==Recta || proxima_peca==Rampa Norte || proxima_peca==Rampa Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Seq: Curva -> Curva
                                                                                                            --
                                                                                                             --
                                                                                                             --CURVA ESTE----
                                                                                                             --
                                                                                                             --Curva Este -> Curva Oeste
                                                                                                             --Carro no sentido dos ponteiros
                                                                                                            |dif_prox_y>0 && (cos (dir_rad-pi/4)<0 && sin (dir_rad-pi/4)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos (dir_rad-pi/4)>=0 && sin (dir_rad-pi/4)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                             -- o carro está a andar no sentido contrário
                                                                                                            |dif_prox_x<0 && (sin (dir_rad+pi/4)>0 && cos (dir_rad+pi/4)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin (dir_rad+pi/4)<=0 && cos (dir_rad+pi/4)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
 
                                                                                                            -- Curva Este -> Curva Sul (sentido dos ponteiros)
                                                                                                            |dif_prox_y>0 && (cos (dir_rad)<0 && sin (dir_rad)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos (dir_rad)>=0 && sin (dir_rad)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Curva Este -> Curva Norte (sentido contrário)
                                                                                                            |dif_prox_x<0 && (sin (dir_rad)>0 && cos (dir_rad)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin (dir_rad)<=0 && cos (dir_rad)> -0.997) && (k==Curva Este) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}


                                                                                                             --CURVA SUL
                                                                                                             --Curva Sul -> Curva Norte
                                                                                                             --
                                                                                                             --Carro no sentido dos ponteiros
                                                                                                            |dif_prox_x<0 && (sin (dir_rad-pi/4)>0 && cos (dir_rad-pi/4)> -0.997) && (k==Curva Sul) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin (dir_rad-pi/4)<=0 && cos (dir_rad-pi/4)> -0.997) && (k==Curva Sul) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Carro no sentido contrário
                                                                                                            |dif_prox_y<0 && (cos (dir_rad+pi/4)>0 && sin (dir_rad+pi/4)< 0.997) && (k==Curva Sul) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos (dir_rad+pi/4)<=0 && sin (dir_rad+pi/4)< 0.997) && (k==Curva Sul) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            
                                                                                                            --Curva Sul -> Curva Oeste (sentido dos ponteiros)
                                                                                                            |dif_prox_x<0 && (sin (dir_rad)>0 && cos (dir_rad)> -0.997) && (k==Curva Sul) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin (dir_rad)<=0 && cos (dir_rad)> -0.997) && (k==Curva Sul) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            
                                                                                                            --Curva Sul -> Curva Este (sentido dos contrário)
                                                                                                            |dif_prox_y<0 && (cos (dir_rad)>0 && sin (dir_rad)< 0.997) && (k==Curva Sul) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos (dir_rad)<=0 && sin (dir_rad)< 0.997) && (k==Curva Sul) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            


                                                                                                             --CURVA OESTE (nao confirmei tao bem)
                                                                                                            --Curva Oeste -> Curva Este
                                                                                                            --
                                                                                                            --Carro no sentido dos ponteiros
                                                                                                            |dif_prox_y<0 && (cos (dir_rad-pi/4)>0 && sin (dir_rad-pi/4)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos (dir_rad-pi/4)<=0 && sin (dir_rad-pi/4)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Carro no sentido contrário
                                                                                                            |dif_prox_x>0 && (sin (dir_rad+pi/4)<0 && cos (dir_rad+pi/4)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin (dir_rad+pi/4)>=0 && cos (dir_rad+pi/4)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Curva Oeste -> Curva Norte (sentido dos ponteiros)
                                                                                                            |dif_prox_y<0 && (cos (dir_rad)>0 && sin (dir_rad)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos (dir_rad)<=0 && sin (dir_rad)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Norte) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Curva Oeste -> Curva Sul (sentido contrário)
                                                                                                            |dif_prox_x>0 && (sin (dir_rad)<0 && cos (dir_rad)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin (dir_rad)>=0 && cos (dir_rad)< 0.997) && (k==Curva Oeste) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                             --CURVA NORTE----
                                                                                                             --
                                                                                                             --Curva norte -> Curva Sul
                                                                                                             --
                                                                                                             --Carro no sentido dos ponteiros
                                                                                                            |dif_prox_x>0 && (sin (dir_rad-pi/4)<0 && cos (dir_rad-pi/4)< 0.997) && (k==Curva Norte) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin (dir_rad-pi/4)>=0 && cos (dir_rad-pi/4)< 0.997) && (k==Curva Norte) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Carro no sentido contrário
                                                                                                            |dif_prox_y>0 && (cos (dir_rad+pi/4)<0 && sin (dir_rad+pi/4)> -0.997) && (k==Curva Norte) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos (dir_rad+pi/4)>=0 && sin (dir_rad+pi/4)> -0.997) && (k==Curva Norte) && (proxima_peca==Curva Sul) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Curva norte -> Curva Este (sentido dos ponteiros)
                                                                                                            |dif_prox_x>0 && (sin (dir_rad)<0 && cos (dir_rad)< 0.997) && (k==Curva Norte) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin (dir_rad)>=0 && cos (dir_rad)< 0.997) && (k==Curva Norte) && (proxima_peca==Curva Este) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Curva norte -> Curva Oeste (sentido contrário)
                                                                                                            |dif_prox_y>0 && (cos (dir_rad)<0 && sin (dir_rad)> -0.997) && (k==Curva Norte) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos (dir_rad)>=0 && sin (dir_rad)> -0.997) && (k==Curva Norte) && (proxima_peca==Curva Oeste) = Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}

                                                                                                            --Seq: Reta/Rampa -> Curva
                                                                                                            --
                                                                                                            --Direção na HORIZONTAL (dif_prox_x diferente de zero)
                                                                                                            --
                                                                                                            --Da esq para a direita
                                                                                                            |dif_prox_x>0 && (sin dir_rad<0 && cos dir_rad< 0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x>0 && (sin dir_rad>=0 && cos dir_rad< 0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Da direita para a esq
                                                                                                            |dif_prox_x<0 && (sin dir_rad>0 && cos dir_rad> -0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_x<0 && (sin dir_rad<=0 && cos dir_rad> -0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --
                                                                                                            --Direção na VERTICAL (dif_prox_y diferente de zero)
                                                                                                            --
                                                                                                            --De cima para baixo
                                                                                                            |dif_prox_y>0 && (cos dir_rad<0 && sin dir_rad> -0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y>0 && (cos dir_rad>=0 && sin dir_rad> -0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            --Da baixo para cima
                                                                                                            |dif_prox_y<0 && (cos dir_rad>0 && sin dir_rad< 0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=True,direita=False,nitro=Nothing}
                                                                                                            |dif_prox_y<0 && (cos dir_rad<=0 && sin dir_rad< 0.9) && (k/=(Curva Norte) && k/=(Curva Sul) && k/=(Curva Oeste) && k/=(Curva Este)) && (proxima_peca==(Curva Norte) || proxima_peca==(Curva Sul) || proxima_peca==(Curva Oeste) || proxima_peca==(Curva Este)) = Acao{acelerar=False,travar=False,esquerda=False,direita=True,nitro=Nothing}
                                                                                                            



                                                                                                           |otherwise = Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing}

--POR NA AUXPOSICAOCAMINHO UM 0 EM VEZ DE 1-Esta feito

                                                                                                                  where proxima_peca = auxIndicaTipoPeca (concat m) (posTab1 m (0,0)) pos_proxima_peca
                                                                                                                        pos_proxima_peca =  auxSeguinte (auxPosicaoCaminho m (posTab1 m (0,0)) o (xi,yi) (xi,yi) 0) (x,y) 1
                                                                                                                       -- 
                                                                                                                        proxima_peca1 = auxIndicaTipoPeca (concat m) (posTab1 m (0,0)) pos_proxima_peca1
                                                                                                                        pos_proxima_peca1 = auxSeguinte (auxPosicaoCaminho m (posTab1 m (0,0)) o (xi,yi) (xi,yi) 0) (realToFrac (fst pos_proxima_peca),realToFrac (snd pos_proxima_peca)) 1 
                                                                                                                       --
                                                                                                                        (xp,yp) = (fst pos_proxima_peca, snd pos_proxima_peca)
                                                                                                                        (xp1,yp1) = (fst pos_proxima_peca1, snd pos_proxima_peca1)
                                                                                                                        dif = yp1 - (floor y)
                                                                                                                        dif_prox_x = xp - (floor x)
                                                                                                                        dif_prox_y = yp - (floor y)
                                                                                                                        -- 
                                                                                                                        dir = auxDirCarro (auxCarro num (ca:la))
                                                                                                                        (x,y) =auxPCarro (auxCarro num (ca:la)) 
                                                                                                                        k= auxIndicaTipoPeca (concat m) (posTab1 m (0,0)) ((floor x), (floor y))
                                                                                                                        dir_rad = (dir*pi)/180
{-| função que dá a posição da peça seguinte
-}
auxSeguinte :: [(Int,Int)]-> (Double,Double)-> Int -> (Int,Int)
auxSeguinte [] (x,y) 0 = (fromIntegral (floor x),fromIntegral (floor y))
auxSeguinte (h:t) (x,y) 0  = h
auxSeguinte (h:t) (x,y) 1 |h== (floor x,floor y) = auxSeguinte t (x,y) 0
                          |otherwise = auxSeguinte t (x,y) 1

