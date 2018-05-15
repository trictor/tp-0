fibonachi 0 = 1
fibonachi 1 = 1
fibonachi numero = (numero - 1) + fibonachi (numero-2)

productodelista [] = 1
productodelista (cabeza:cola) = cabeza * productodelista cola

alreves [] = []
alreves (x:xs) = alreves xs ++ [x]

diferencia (x:[]) = x - 0
diferencia (x:y:xs) =  (x - y) : diferencia (y:xs)

esmenora20 [] = []
esmenora20 (x:xs) | x < 20 = x : esmenora20 xs
                  | otherwise = esmenora20 xs

sontodosiguales [] = True
sontodosiguales (x:y:xs) = (x == y) && sontodosiguales xs

esmultiplodealguno numero lista = any ((== 0).mod numero) lista

promediolista lista = div (sum lista)  (length lista)

--sinextremos [] = []
--sinextremos (x:xs) | maximum (x:xs) == x || minimum (x:xs) == x = xs

aplicarfuncion funcion numero = funcion numero

aplicarlistadefunciones lista numero = foldr aplicarfuncion numero lista

subirhabilidad [] = []
subirhabilidad (x:xs) | x < 4 = 4 : subirhabilidad xs
                      | otherwise = x : subirhabilidad xs

intercalar _ [] = []
intercalar expresion (x:xs) = (x:expresion:(intercalar expresion xs))

primerosdivisores numero lista = takeWhile ((==0).mod numero) lista
