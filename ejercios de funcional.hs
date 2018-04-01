esmultiplodetres numero = (mod numero 3) == 0
esmultiplodedos numero = (igualacero.divisor) numero
igualacero numero = numero ==0
divisor numero = mod numero 2
cubodenumero numero = numero * numero * numero
area base altura = base * altura
decelafar celcius = celcius * 1.80 + 32
defaracel fahrenheit = (fahrenheit-32)/1.80
hacefriof grados = decelafar grados < 8
dispersion med1 med2 med3 = max(max med1 med2) med3 - min(min med1 med2) med3
diasparejos med1 med2 med3 = dispersion med1 med2 med3 < 30
diaslocos med1 med2 med3 =dispersion med1 med2 med3 >1000
diasnormales med1 med2 med3 = not(diasparejos med1 med2 med3) && not(diaslocos med1 med2 med3)
siguiente = (1+)
mitad = (/2)
inversa = (1/)
raizcuadrada numero = numero^1/2
inversaraizcuadrada numero = (inversa.raizcuadrada) numero
elevaralaN numero = (^) numero
resultadopar numero =(.) (esmultiplodedos) (elevaralaN numero)
mejor funcion1 funcion2 numero= max (funcion1 numero) (funcion2 numero)
frecuencia = [80, 100, 120, 128, 130, 123, 125]
promedio lista = sum lista /  fromInteger(toInteger(length lista ))
ubicacion minutos = minutos / 10
frecuenciaminutos lista minutos = lista !! minutos
frecuenciahasta minutos lista = take minutos lista
thrd (_,_,c) = c
existany funcion tupla = funcion (fst tupla) || funcion (snd tupla)
capicua lista = concat lista == reverse(concat lista)
palabraalrevez lista =reverse(concat lista)
promediolistadelista lista = map (promedio) lista
exist funcion lista = any (funcion) lista
aplicarfunciones lista numero = map numero lista
