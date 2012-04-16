== Hola Rails

hola-rails es un proyecto base en Rails 3.1 que incluye algunas modificaciones
para trabajar en Español.

Por medio de inflections se modifica la forma en la que rails "pluraliza" y
"singulariza" los nombres. Esto permite tener los nombres de los modelos y
de las tablas de las bases de datos en español.

Se incluyen algunos ejemplos a problemas comunes que se pueden encontrar al
tratar de realizar estas traducciones.

También se han agregado las traducciones al archivo de locales en español para
mostrar los mensajes de error traducidos. NOTA: las traducciones se han tomado
del recurso en github de rails-i18n, en la siguiente url
https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/es-MX.yml
y se han modificado como ejemplo para adaptar a las necesidades específicas.

Para complementar los mensajes de error, se ha agregado una vista para hacer render 
de los mensajes ya traducidos al español. Se intenta "adivinar" el género del modelo
para mostrar el mensaje correctamente traducido, sin embargo, esta inferencia no
siempre funciona, por lo que es posible agregar un parámetro a la llamada del render
indicando el género correcto.
  
Estas reglas no contemplan todas las posibilidades para formar plurales en Español, 
sólo las más comunes. Es probable que más adelante se agreguen algunas más.
