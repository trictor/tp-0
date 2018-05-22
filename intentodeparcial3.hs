{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions
import Data.List
import Data.Maybe
import Test.Hspec

data Persona = Persona{
 edad :: Float,
 peso :: Float,
 tonificacion :: Float
}deriving (Show, Eq)

pancho = Persona 40 120 1
andres = Persona 22 80 6

esSaludable unapersona = peso unapersona <= 100 && tonificacion unapersona >= 5

nuevopeso unpeso unapersona = unapersona {peso = unpeso}
nuevotonificacion untoni unapersona = unapersona {tonificacion = untoni }
quemarCalorias unasCalorias unapersona | peso unapersona >= 100 = nuevopeso (peso unapersona - (unasCalorias /150)) unapersona
                                       | edad unapersona >=30 && unasCalorias >=200 = nuevopeso (peso unapersona -1) unapersona
                                       | otherwise = nuevopeso (peso unapersona - unasCalorias / (edad unapersona * peso unapersona)) unapersona

caminata minutos = quemarCalorias (1*5*minutos)
pesas kilodelaspesas minutos unapersona | minutos > 10 = nuevotonificacion (kilodelaspesas/minutos) unapersona
                                        | otherwise = id unapersona

colina inclinacion minutos = quemarCalorias (2*minutos*inclinacion)

montaña inclinacion minutos = (colina (inclinacion + 3) (minutos/2)).(colina inclinacion (minutos/2))

rutina = [caminata 40,colina 5 40,montaña 5 40]

hacerEjercio unejercicio unapersona = unejercicio unapersona

aplicarRutina unapersona unarutina = foldr hacerEjercio unapersona unarutina
