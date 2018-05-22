{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions
import Data.List
import Data.Maybe
import Test.Hspec

data Gema = Gema {
  nombre :: String,
  fuerza :: Float,
  personalidad :: (Situacion -> Situacion)
} deriving (Show)


data Aspecto = UnAspecto {
  tipoDeAspecto :: String,
  grado :: Float
} deriving (Show, Eq)
type Situacion = [Aspecto]



mejorAspecto mejor peor = grado mejor <= grado peor

mismoAspecto aspecto1 aspecto2 = tipoDeAspecto aspecto1 == tipoDeAspecto aspecto2

buscarAspecto aspectoBuscado = head.filter (mismoAspecto aspectoBuscado)

reemplazarAspecto aspectoBuscado situacion =
    aspectoBuscado : (filter (not.mismoAspecto aspectoBuscado) situacion)

modificarAspecto funcionModificadora aspectoAmodificar = aspectoAmodificar {grado = (funcionModificadora.grado) aspectoAmodificar }

situacionMejor [] [] = True
situacionMejor (x:xs) (y:ys) = mejorAspecto x y && situacionMejor xs ys

bajarTodosLosAspectosEn10 [] = []
bajarTodosLosAspectosEn10 (x:xs) = modificarAspecto (+(-10)) x : bajarTodosLosAspectosEn10 xs
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
--------------------------------------------------------------------------------------------
vidente :: Situacion -> Situacion
vidente situacion = reemplazarAspecto (modificarAspecto (+(-10)) tension) (reemplazarAspecto (modificarAspecto (/2) incertidumbre) situacion)

descansada :: Float -> Situacion -> Situacion
descansada nivelDeRelajamiento situacion = reemplazarAspecto (modificarAspecto (+(-30)) tension) (reemplazarAspecto (modificarAspecto (+ nivelDeRelajamiento) peligro) situacion)
----------------------------------------------------------------------------------------------------
garnet = Gema {
 nombre = "garnet",
 fuerza = 100,
 personalidad = vidente
}

amatista = Gema {
 nombre = "amatista",
 fuerza = 70,
 personalidad = descansada 10
}
perla = Gema {
 nombre = "perla",
 fuerza = 20,
 personalidad = vidente
}
peleaDeGemas gema1 gema2 situacion = (fuerza gema1) > (fuerza gema2) && situacionMejor ((personalidad gema1) situacion) ((personalidad gema2) situacion)
-------------------------------------------------------------------------------------------------
nombreDeLafusion gema1 gema2 | nombre gema1 == nombre gema2 = nombre gema1
                             | otherwise = nombre gema1 ++ nombre gema2

personalidadFusionada gema1 gema2 = (personalidad gema1).(personalidad gema2).bajarTodosLosAspectosEn10

gemaDominante gema1 gema2 situacion | peleaDeGemas gema1 gema2 situacion = gema1
                                    | otherwise = gema2
