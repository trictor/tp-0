esmultiplodetres numero = (mod numero 3) == 0
esmultiplodedos numero = (mod numero 2) == 0
cubodenumero numero = numero * numero * numero
area base altura = base * altura
decelafar celcius = celcius * 1.80 + 32
defaracel fahrenheit = (fahrenheit-32)/1.80
hacefriof grados = decelafar grados < 8
dispersion med1 med2 med3 = max(max med1 med2) med3 - min(min med1 med2) med3
diasparejos med1 med2 med3 = dispersion med1 med2 med3 < 30
diaslocos med1 med2 med3 = dispersion med1 med2 med3 >1000
diasnormales med1 med2 med3 = not(diasparejos med1 med2 med3) && not(diaslocos med1 med2 med3)
