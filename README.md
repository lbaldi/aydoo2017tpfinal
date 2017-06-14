# aydoo2017tpfinal

[![Build Status](https://travis-ci.org/lbaldi/aydoo2017tpfinal.svg?branch=master)](https://travis-ci.org/lbaldi/aydoo2017tpfinal)

* Moreno Hernan
* Baldi Leandro

# Criterios de diseño

* Uso de Marshal para convertir los objetos en algo persistible.
* Uso de polimorfismo para poder modelar diferentes tipos de evento y frecuencias
* Al iniciar la aplicacion el repositorio es cargado de disco o se crea un nuevo repositorio en caso de que no exista archivo.
* Tras cada llamada a la api ( exceptuando los GET) se persisten los datos
* Los repositorios se encargan de validar todo lo necesario en cada nuevo almacenaniento
* Se decidio no generar una funcion para actualizacion en el modelo de datos. Al realizar un PUTS en la api se eliminan y crean nuevos objetos copiandos los valores originales que no hayan sido modificados. Con esto logramos simplificar la validacion de los datos ingresados, como asi tambien el solapamiento.

# Pendientes

* Diagramas de secuencias para todas las acciones posibles en la api
* Refactor de la app. Hay codigo repetido.
