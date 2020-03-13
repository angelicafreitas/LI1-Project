{-|
Module      : Tarefa5_2017li1g104
Description : Módulo da Tarefa 5 para LI1 17/18

Módulo para a realização da Tarefa 5 de LI1 em 2017/18.
-}
module Main where


import Tarefa3_2017li1g104
import Tarefa4_2017li1g104
import LI11718
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Bitmap
import System.IO
import Data.Maybe
import GHC.Float


{-| Tipo correspondente ao estado do jogo
-}
type Estado = ((Float,Float),Jogo,(Picture,Picture,Picture),(Picture,Picture,Picture,Picture))


{-| Função que define um estado inicial para o jogo, atribuindo imagens às entidades correspondentes aos carros e aos diferentes tipos de peças
-}
estadoInicial :: IO Estado
estadoInicial = do
    c1 <- loadBMP "car1.bmp"
    c2 <- loadBMP "car2.bmp"
    c3 <- loadBMP "car3.bmp"
    lava <- loadBMP "lava.bmp"
    recta <- loadBMP "recta.bmp"
    curva <- loadBMP "curva.bmp"
    rampa <- loadBMP "rampa.bmp"
    return ((5,5),jogoInicial,(c1,c2,c3),(lava,recta,curva,rampa))


{-| função correspondente aos valores iniciais de nitro para cada um dos 3 carros
-}
nitroInicial :: [Tempo]
nitroInicial = [propNitro,propNitro,propNitro]

{-| função correspondente às propriedades de um percurso inicial
-}
pistaInicial :: Propriedades
pistaInicial = Propriedades 2 3 4 2 propNitro 180

{-| função correspondente ao tempo inicial de nitro
-}
propNitro :: Tempo
propNitro = 15

{-| função que dá a lista que contém os carros do jogo
-}
carrosInicial :: [Carro]
carrosInicial = (carro1 : carro2 : carro3 : [ ])

{-| função que dá o histórico de posições inicial do jogo
-}
historicoInicial :: [[Posicao]]
historicoInicial = [[(2,1)],[(2,1)],[(2,1)]]


{-| função que dá o primeiro carro do jogo
-}
carro1 :: Carro
carro1 = Carro {posicao = (2,1.5), direcao = 0, velocidade = (1.54,0)}

{-| função que dá o segundo carro do jogo
-}
carro2 :: Carro
carro2 = Carro {posicao = (2,1), direcao = 0, velocidade = (1,0)}

{-| função que dá o terceiro carro do jogo
-}
carro3 :: Carro
carro3 = Carro {posicao = (2,0.5), direcao = 0, velocidade = (1,0)}


{-| função que dá o jogo inicial, combinando várias funções auxiliares
-}
jogoInicial :: Jogo
jogoInicial = Jogo{mapa=mapaInicial,pista=pistaInicial,carros=carrosInicial,nitros=nitroInicial,historico=historicoInicial}


{-| função que dá o mapa do jogo
-}
mapaInicial :: Mapa
mapaInicial = Mapa ((2,1),Este) tabInicial


{-| função que dá o tabuleiro do jogo
-}
tabInicial :: Tabuleiro
tabInicial = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]



{-| Reage ao pressionar das setas do teclado, aplicando a atualizaMovimenta aos carros
-}
reageEvento :: Event -> Estado -> Estado
reageEvento (EventKey (SpecialKey KeyDown) Down _ _) ((xMapa,yMapa),jogoInicial,(c1,c2,c3),(lava,recta,curva,rampa)) = ((xMapa,yMapa-5),(atualizaMovimenta 0.3 jogoInicial [(Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing})]),(c1,c2,c3),(lava,recta,curva,rampa))
reageEvento (EventKey (SpecialKey KeyUp) Down _ _) ((xMapa,yMapa),jogoInicial,(c1,c2,c3),(lava,recta,curva,rampa)) = ((xMapa,yMapa+5),(atualizaMovimenta 0.3 jogoInicial [(Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=False,direita=False,nitro=Nothing})]),(c1,c2,c3),(lava,recta,curva,rampa))
reageEvento (EventKey (SpecialKey KeyLeft) Down _ _) ((xMapa,yMapa),jogoInicial,(c1,c2,c3),(lava,recta,curva,rampa)) = ((xMapa+5,yMapa),(atualizaMovimenta 0.3 jogoInicial [(Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=True,direita=False,nitro=Nothing})]),(c1,c2,c3),(lava,recta,curva,rampa))
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) ((xMapa,yMapa),jogoInicial,(c1,c2,c3),(lava,recta,curva,rampa)) = ((xMapa-5,yMapa),(atualizaMovimenta 0.3 jogoInicial [(Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing}),(Acao{acelerar=True,travar=False,esquerda=False,direita=True,nitro=Nothing})]),(c1,c2,c3),(lava,recta,curva,rampa))
reageEvento _ e = e


{-| Reage ao passar do tempo no jogo
-}
reageTempo :: Float -> Estado -> Estado
reageTempo tick e = e

{-| função que estabelece a taxa de atualização do jogo
-}
fr :: Int
fr = 50

{-| função que estabelece a janela do jogo
-}
screen :: Display
screen = InWindow "Micro Machines" (800,600) (0,0)


{-| função responsável por "jogar" Micro Machines
-}
joga :: Estado -> IO ()
joga inicial = play
    screen -- Janela do jogo
    (greyN 0.5) -- Cor do fundo da janela
    fr -- refresh rate
    inicial -- estado inicial
    desenhaEstado -- função que desenha o mapa
    reageEvento -- função que reage a um evento (carregar numa tecla, mover o rato, etc)
    reageTempo -- função que reage ao passar do tempo


{-| função principal, que inicia o jogo
-}
main :: IO ()
main = do 
    inicial <- estadoInicial
    joga inicial

-----------------------

{-| função que aplica a jogoAct a todos os jogadores
-}
atualizaMovimenta :: Tempo -> Jogo -> [Acao] -> Jogo
atualizaMovimenta 0 e (a : as) = e
atualizaMovimenta tick e [ ] = e
atualizaMovimenta tick (Jogo (Mapa ((x,y),o) tab) p cs nit hist) (a : as) = novoJogo
     where novoJogo = jogoAct tick (Jogo (Mapa ((x,y),o) tab) p (carrosAct tab tick cs) nit hist) [1,2,3] a

{-| função que aplica a movimenta a todos os carros do jogo
-}
carrosAct :: Tabuleiro -> Tempo -> [Carro] -> [Carro]
carrosAct [ ] tick (c : cs) = (c : cs)
carrosAct tab tick [ ] = [ ]
carrosAct tab tick (c : cs) = (fromJust (movimenta tab tick c)) : (carrosAct tab (tick-1) cs)


{-| função que aplica a atualiza a todos os jogadores
-}
jogoAct :: Tempo -> Jogo -> [Int] -> Acao -> Jogo
jogoAct tick e [ ] a = e
jogoAct 0 e (j : js) a = e
jogoAct tick e (j : js) a = jogoAct (tick-1) (atualiza tick e j a) js a



{-| função que desenha o mapa do jogo
-}
desenhaTMapa :: Estado -> Picture
desenhaTMapa ((xMapa,yMapa),(Jogo (Mapa ((x,y),o) tab) p cs nit hist),(c1,c2,c3),(lava,recta,curva,rampa)) = Pictures (desenhaTab tab (0,0) ((xMapa,yMapa),(Jogo (Mapa ((x,y),o) tab) p cs nit hist),(c1,c2,c3),(lava,recta,curva,rampa)))


{-| função que desenha um tabuleiro
-}
desenhaTab :: Tabuleiro -> (Float,Float) -> Estado -> [Picture]
desenhaTab [] _ _ = []
desenhaTab (((Peca a b) : t) : t2) (x,y) (m,j,imc,(lava,recta,curva,rampa)) = (Pictures (desenhaLinha ((Peca a b) : t) (x,y) (m,j,imc,(lava,recta,curva,rampa)))) : (desenhaTab t2 (x,y+50) (m,j,imc,(lava,recta,curva,rampa)))


{-| função que desenha uma lista de peças
-}
desenhaLinha :: [Peca] -> (Float,Float) -> Estado -> [Picture]
desenhaLinha [] _ _ = []
desenhaLinha ((Peca a b) : t) (x,y) (m,j,imc,(lava,recta,curva,rampa))
    |(a == Lava) = (Translate x y lava) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Recta) = (Translate x y recta) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Curva Oeste) = (Translate x y (Rotate 90 curva)) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Curva Norte) = (Translate x y curva) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Curva Este) = (Translate x y (Rotate 270 curva)) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Curva Sul) = (Translate x y (Rotate 180 curva)) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Rampa Norte) = (Translate x y rampa) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Rampa Sul) = (Translate x y rampa) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Rampa Este) = (Translate x y rampa) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))
    |(a == Rampa Oeste) = (Translate x y rampa) : (desenhaLinha t (x+50,y) (m,j,imc,(lava,recta,curva,rampa)))




{-| função que desenha o estado do jogo
-}
desenhaEstado :: Estado -> Picture
desenhaEstado ((xMapa,yMapa),(Jogo (Mapa ((x,y),o) tab) p cs nit hist),(c1,c2,c3),(lava,recta,curva,rampa)) = Pictures [tabuleiro,carro1,carro2,carro3]
    where
    -- tabuleiro do jogo, centrado na janela
    tabuleiro = Scale 1.2 1.2 (desenhaTMapa ((xMapa,yMapa),(Jogo (Mapa ((x,y),o) tab) p cs nit hist),(c1,c2,c3),(lava,recta,curva,rampa)))
    -- carros dentro do mapa do jogo
    carro1 = Translate (90-xMapa) (170+yMapa) c1

    carro2 = Translate (90-(2*xMapa/3)) (180+(2*yMapa/3)) c2

    carro3 = Translate (90-(2*xMapa/3)) (190+(2*yMapa/3)) c3