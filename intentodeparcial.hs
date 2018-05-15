{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions
import Data.List
import Data.Maybe
import Test.Hspec

data Gema = Gema {
  nombre :: String,
  fuerza :: Float,
  personalidad :: String
} deriving (Show, Eq)


data Aspecto = UnAspecto {
  tipoDeAspecto :: String,
  grado :: Float
} deriving (Show, Eq)
type Situacion = [Aspecto]



mejorAspecto mejor peor = grado mejor > grado peor
mismoAspecto aspecto1 aspecto2 = tipoDeAspecto aspecto1 == tipoDeAspecto aspecto2
buscarAspecto aspectoBuscado = head.filter (mismoAspecto aspectoBuscado)
reemplazarAspecto aspectoBuscado situacion =
    aspectoBuscado : (filter (not.mismoAspecto aspectoBuscado) situacion)
modificarAspecto funcionModificadora aspectoAmodificar = aspectoAmodificar {grado = (funcionModificadora.grado) aspectoAmodificar }

--------------------------------------------------------------------
tension= UnAspecto "tension" 15
incertidumbre= UnAspecto "incertidumbre" 10
peligro= UnAspecto "peligro" 5
-----------------------------------------------------
tension2= UnAspecto "tension" 3
incertidumbre2= UnAspecto "incertidumbre" 2
peligro2= UnAspecto "peligro" 1
---------------------------------------------------
situacion1 = [tension,incertidumbre,peligro]
situacion2 = [tension2,incertidumbre2,peligro2]


situacionMejor [] [] = True
situacionMejor (x:xs) (y:ys) = mejorAspecto x y && situacionMejor xs ys

vidente situacion = reemplazarAspecto (modificarAspecto (+ (-10)) tension) (reemplazarAspecto (modificarAspecto (/2) incertidumbre) situacion)
