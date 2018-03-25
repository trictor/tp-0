import Text.Show.Functions

data chiste = chiste {
  contenido :: String
  likes :: Int
} deriving (Show)

nuevocontenido uncontenido unchiste = unchiste{contenido = uncontenido}
nuevoslikes maslikes unchiste = unchiste{likes = maslikes }
