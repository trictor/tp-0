import Text.Show.Functions

data chiste = chiste {
  contenido :: string
  likes :: int
} deriving (Show)

nuevocontenido uncontenido unchiste = unchiste{contenido = uncontenido}
nuevoslikes maslikes unchiste = unchiste{likes = maslikes }
