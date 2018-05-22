{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions
import Data.List
import Data.Maybe
import Test.Hspec

data Helado = Helado {
 nombre :: String,
 temperatura :: Int,
 proporcióndeagua :: Float
}deriving (Show, Eq)

data CajondeFrutas = CajondeFrutas {
 nombreDelcajon :: String,
 kilogramos :: Float
}deriving (Show, Eq)

data Bidon = Bidon {
 temperaturaDeAgua :: Int,
 cantidadDeAgua :: Float
}deriving (Show, Eq)

heladera nuevatemperatura helado = helado {temperatura = ((-) nuevatemperatura.temperatura) helado}

cajondementa = CajondeFrutas "menta" 100
bidon1 = Bidon (-50) 500
frutilla = Helado "Frutilla" (-20) 0.2
vainilla = Helado "vainilla" (-10) 0.6


batidora uncajon unbidon = Helado {
 nombre = nombreDelcajon uncajon,
 temperatura = temperaturaDeAgua unbidon,
 proporcióndeagua = kilogramos uncajon / cantidadDeAgua unbidon
}

extrimidora uncajon = uncajon {kilogramos=kilogramos uncajon / 2}

dispenser unbidon = unbidon {temperaturaDeAgua = 0}

mixDeFrutas helado1 helado2 = Helado {
 nombre = nombre helado1 ++ "-" ++ nombre helado2,
 temperatura = min (temperatura helado1) (temperatura helado2),
 proporcióndeagua = (proporcióndeagua helado1 + proporcióndeagua helado2) / 2
}
