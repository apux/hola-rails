# Be sure to restart your server when you modify this file.

ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  
  ###########################################################################
  # Inflections para trabajar en Español.
  # Por omisión, rails obtiene el singular y el plural según las reglas en 
  # Inglés. La regla más básica consiste en agregar una 's' al final de la 
  # palabra al obtener su plural, y eliminar la 's' al final para obtener el 
  # singular. En español, esta regla se cumple la mayoría de las veces, pero 
  # no siempre, por lo que es necesario especificar algunas más para las 
  # excepciones.
  #
  # Las reglas para la formación del plural en Español son muy completas
  # (y complejas), en algunas ocasiones dependen de la acentuación. No se
  # pretende contemplar todas las posibilidades, sólo las más comunes.
  ###########################################################################
  
  # Para formar correctamente el plural de palabras como doctor => doctores, 
  # camion => camiones, universidad => universidades, pastel => pasteles
  # (de otra forma, se obtendrían como doctors, camions, universidads 
  # y pastels).
  # Las palabras que terminen con r, n, d, l se convierten a plural 
  # agregando "es".
  inflect.plural(/(r|n|d|l)$/i, '\1es')

  # Rails incluye una regla para obtener el plural de las palabas que 
  # terminan en "um" cambiando el final por "ia", por ejemplo, medium => media
  # De igual forma, al obtener el singlular de palabras que terminan con "ia", 
  # convierte el final en "um", ejemplo, media => medium.
  # En español no se trabaja con esa regla, por lo que se indica al
  # inflection que las palabras que terminen con "ia" ya están en singular
  # (se dejan tal cual)
  inflect.singular(/(ia)$/i, '\1')

  # Para obtener correctamente el plural de palablas como maiz => maices, 
  # pez => peces, las palabras terminadas en z se cambian la z por c, y 
  # se agrega "es"
  inflect.plural(/(z)$/i, 'ces')

  # Para singularizar, generalmente basta con eliminar la 's' del final, pero
  # palabras como doctores, universidades se convertirían erróneamente (su
  # singular sería doctors, universidads). 
  # La forma básica es que cuando la palabra termina en "es", eliminar esa sílaba.
  # Esto es correcto en palabras como "doctores" o "camiones", porque su singular 
  # son "doctor" y "camion", respectivamente. Sin embargo, hay otras palabras que 
  # se convertirían erróneamente, como semestres => semestr
  # Para evitar eso, se obliga que la palabra que termina en "es" y venga
  # precedida de r, n, d o l, deba también ser precedida por una vocal. Con esto,
  # palabras como "semestres" son procesados por la regla básica de eliminar la
  # 's', semestres => semestre, pero doctores es procesado por la nueva regla, 
  # doctores => doctor
  inflect.singular(/([aeiou][rndl])es$/i, '\1')
  
  
  ###########################################################################
  # Ejemplos de términos irregulares.
  # Es necesario incluir las dos versiones(underscore y CamelCase) en caso 
  # de tener palabras compuestas
  ###########################################################################
  
  # Por ejemplo, pais, es un caso especial, ya que termina en s pero no debe ser 
  # consierado plural. Se le indica que el plural de pais es paises, el singular
  # de paises es pais, y que pais ya está en singular.
  # Se declara utilizando expresiones regulares para indicar que sólo realize el 
  # inflection cuando encuentre la palabra aislada, ya que de otra forma, trataría
  # de hacer la sustitución en cualquier parte de una cadena en la que encontrara
  # la palabra (esto provocaría, entre otras cosas, un error originado por la
  # recursividad: la cadena "paises" internamente tiene la palabra "pais")
  inflect.plural /^pais$/, 'paises'
  inflect.singular /^paises$/, 'pais'
  inflect.singular /^pais$/, 'pais'

  # Algunos casos comunes se dan al utilizar palabras compuestas (ambas se 
  # convierten en plural)
  inflect.irregular 'nombre_especial', 'nombres_especiales'
  inflect.irregular 'NombreEspecial', 'NombresEspeciales'
  # Sólo la primera se converte en plural 
  inflect.irregular 'hermano_de_sangre', 'hermanos_de_sangre'
  inflect.irregular 'HermanoDeSangre', 'HermanosDeSangre'
  # Cuando sólo la segunda se convierte en plural, generalmente no es necesario
  # definirlo, ya que ése es el comportamiento por omisión de rails
  
  # Caso especial en el que la última palabra termina con 's' desde su versión
  # en singular (caso similar al de pais, pero en esta ocasión, con palabras
  # compuestas)
  inflect.irregular 'calificacion_matematicas', 'calificaciones_matematicas'
  inflect.irregular 'CalificacionMatematicas', 'CalificacionesMatematicas'
  # es necesario especificar que calificacion_matematicas ya está en singular
  # para que no trate de convertirlo erróneamente a 'calificacion_matematica'
  inflect.singular('calificacion_matematicas', 'calificacion_matematicas')
  inflect.singular('CalificacionMatematicas', 'CalificacionMatematicas')
    

  ###########################################################################
  # Ejemplos cuyo plural y singular sea el mismo
  ###########################################################################
  inflect.uncountable %w( campus lunes martes miercoles jueves viernes )
  # NOTA: Si genera recursos restful-like (en routes) con estos nombres, verifique
  # los métodos que se generan, ya que cambian un poco del estándar, por ejemplo, 
  # el index de campus lo encontramos en campus_index_path en lugar de 
  # campus_path, ya que este último se utilizaría para show
end
