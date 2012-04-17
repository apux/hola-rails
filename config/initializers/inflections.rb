# Be sure to restart your server when you modify this file.

ActiveSupport::Inflector.inflections do |inflect|
  
  ############################################################################
  # Inflections para trabajar en Español.
  # Por omisión, rails obtiene el singular y el plural según las reglas en 
  # Inglés. La regla más básica consiste en agregar una 's' al final de la 
  # palabra al obtener su plural, y eliminar la 's' al final para obtener el 
  # singular. En español, esta regla se cumple la mayoría de las veces, pero 
  # no siempre, por lo que es necesario especificar algunas más para las 
  # excepciones.
  #
  # Las reglas para la formación del plural en Español son muy completas (y 
  # complejas), en algunas ocasiones dependen de la acentuación. No se 
  # pretende contemplar todas las posibilidades, sólo las más comunes.
  ############################################################################
  
  # La regla básica en Español es que el plural de las palabras terminadas 
  # en vocal se obtiene agregándole una 's' al final.
  # Sin embargo, para formar correctamente el plural de palabras como 
  # doctor => doctores, camion => camiones, universidad => universidades, 
  # pastel => pasteles, se aplica otra regla: las palabras que terminen 
  # con r, n, d, l se convierten a plural agregando "es", de otra forma, 
  # el plural se obtendrían como doctors, camions, universidads y pastels.
  # Ahora bien, para las palabras compuestas, esto también debe ser válido. Es
  # decir, se deben convertir a plural todas las palabras que la compongan. 
  # También hay que tomar en cuenta que las palabras compuestas pueden estar 
  # como 'underscore' o como 'camelcase'.
  inflect.plural(/([rndl])([A-Z]|_|$)/, '\1es\2')
  inflect.plural(/([aeiou])([A-Z]|_|$)/, '\1s\2')
  # Las reglas anteriores funcionan incluso cuando son palabras compuestas por
  # dos o más palabras, siempre y cuando, todas sean del mismo tipo, es decir, 
  # que ambas terminen con r, n, d o l, o bien, que ambas terminen en vocal; 
  # por ejemplo "doctor_operacion", o "libro_revista", serán pluralizadas 
  # correctamente a "doctores_operaciones" y "libros_revistas" respectivamente.
  # Sin embargo, si las palabras no son del mismo tipo, la pluralización no
  # ocurre correctamente. Por ejemplo, "autor_libro" es pluralizado como 
  # "autor_libros", y "paciente_doctor" es pluralizado como 
  # "paciente_doctores". Esto sucede porque al pluralizar, rails aplica sólo 
  # una regla y omite las demás.
  # Para soportar palabras compuestas, es necesario agregar otras reglas.
  inflect.plural(/([aeiou])([A-Z]|_)([a-z]+)([rndl])([A-Z]|_|$)/, 
                 '\1s\2\3\4es\5')
  inflect.plural(/([rndl])([A-Z]|_)([a-z]+)([aeiou])([A-Z]|_|$)/, 
                 '\1es\2\3\4s\5')
  # Con estas reglas, ya se pueden traducir correctamente las palabras compuestas
  # de dos palabras aunque no sean del mismo tipo.
  # Se pueden agregar, de la misma manera, reglas para cuando se trate de tres
  # palabras compuestas, pero esto significa tomar en cuenta más combinaciones. 
  # En la mayoría de los casos, creo que es suficiente con estas dos.

  # Para obtener correctamente el plural de palablas como maiz => maices, 
  # pez => peces, las palabras terminadas en z se cambian la z por c, y 
  # se agrega "es"
  inflect.plural(/(z)$/i, 'ces')

  # Rails incluye una regla para obtener el plural de las palablas que 
  # terminan en "um" cambiando el final por "ia", por ejemplo, medium => media
  # De igual forma, al obtener el singular de palabras que terminan con "ia", 
  # convierte el final en "um", ejemplo, media => medium.
  # En español no se trabaja con esa regla, por lo que se indica al
  # inflection que las palabras que terminen con "ia" ya están en singular. 
  # Así, al tratar de singularizar materia, se queda como 'materia' y no como 
  # materium
  inflect.singular(/(ia)$/i, '\1')

  # Para singularizar, generalmente basta con eliminar la 's' del final, pero
  # palabras como doctores y universidades se convertirían erróneamente como
  # doctore y universidade.
  # La forma básica es que cuando la palabra termina en "es", eliminar esa 
  # sílaba, pero esto tampoco es del todo cierto, ya que funciona con palabras 
  # como "doctores" o "camiones", porque su singular son "doctor" y "camion", 
  # respectivamente. Sin embargo, hay otras palabras que se convertirían 
  # erróneamente, como semestres, por ejemplo, que al eliminar la sílaba "es"
  # del final, se singularizaría como semestr. Para evitar eso, se obliga que
  # la palabra que termina en "es" y venga precedida de r, n, d o l, deba 
  # también ser precedida por una vocal. 
  # Con esto, palabras como "semestres" son procesados por la regla básica de 
  # eliminar la 's', semestres => semestre, pero doctores es procesado por la 
  # nueva regla, doctores => doctor
  # NOTA: el orden en el que aparecen las siguientes dos reglas es importante,
  # ya que si las introducimos en orden inverso, rails ejecuta primero la 
  # última que encuentra, haciendo que "doctores" cumpla con ella, y 
  # singularizando de manera errónea a "doctore"
  r_final_palabra_rndl = /([aeiou][rndl])es([A-Z]|_|$)/
  r_final_palabra_vocal = /((?<![aeiou][nrdl])[aeiou])s([A-Z]|_|$)/

  inflect.singular(r_final_palabra_rndl, '\1\2')
  inflect.singular(r_final_palabra_vocal, '\1\2')

  # De manera similar al caso de pluralización, se necesitan las reglas 
  # adicionales para permitir que palabras compuestas puedan ser singularizadas 
  # de manera correcta.
  inflect.singular(
    /#{r_final_palabra_rndl}([a-z]+)#{r_final_palabra_vocal}/, 
    '\1\2\3\4\5'
  )
  inflect.singular(
    /#{r_final_palabra_vocal}([a-z]+)#{r_final_palabra_rndl}/, 
    '\1\2\3\4\5'
  )

  # Para singularizar palabras con 'ces', como 'maices'
  inflect.singular(/ces$/, 'z')
  
  ############################################################################
  # Ejemplos de términos irregulares.
  ############################################################################
  
  # Por ejemplo, pais, es un caso especial, ya que termina en s pero no debe ser 
  # consierado plural, por lo tanto, se le indica que el singular de 'pais' es 
  # 'pais' y no 'pai'
  inflect.singular 'pais', 'pais'
  # También es necesario indicar que es irregular, para que al pluralizar y 
  # ingularizar lo haga correctamente.
  inflect.irregular 'pais', 'paises'
  # NOTA: el orden de estas dos reglas es importante, ya que si se invierten, 
  # rails ejecutaría primero la regla para singularizar, y dado que en 'paises'
  # encuentra el patrón 'pais', realiza la sustición para pasarlo a singular, 
  # dando como resultado que el singular de 'paises' sea, erróneamente, 
  # 'paises'

  # En ocasiones, quisiéramos aplicar reglas específicas que no cumplen con las
  # generales. Por ejemplo, si a estas alturas tratamos de obtener el plural de
  # "hermano_de_sangre", el resultado sería "hermanos_des_sangres", así que, 
  # para estos casos, es necesario agregar reglas para indicar estos 
  # comportamientos 'irregulares'.
  inflect.irregular 'hermano_de_sangre', 'hermanos_de_sangre'
  inflect.irregular 'HermanoDeSangre', 'HermanosDeSangre'
  # NOTA: es necesario indicar los dos modos (underscore y camelcase) porque el 
  # método irregular no soporta expresiones regulares
  
  # Caso especial en el que la última palabra termina con 's' desde su versión
  # en singular (caso similar al de pais, pero en esta ocasión, con palabras
  # compuestas)
  inflect.singular 'calificacion_matematicas', 'calificacion_matematicas'
  inflect.singular 'CalificacionMatematicas', 'CalificacionMatematicas'
  inflect.irregular 'calificacion_matematicas', 'calificaciones_matematicas'
  inflect.irregular 'CalificacionMatematicas', 'CalificacionesMatematicas'
  # NOTA: por claridad, se indican los dos modos (underscore y camelcase) 
  # porque el  método irregular no soporta expresiones regulares, aunque en el
  # caso del singular sí, por lo que se puede escribir también de la siguiente
  # manera:
  # inflect.singular /([Cc])(alificacion)(_m|M)(atematicas)/, '\1\2\3\4'

  ############################################################################
  # Ejemplos cuyo plural y singular sea el mismo
  ############################################################################
  inflect.uncountable %w( campus lunes martes miercoles jueves viernes )
  # NOTA: Si genera recursos restful-like (en routes) con estos nombres, 
  # verifique los métodos que se generan, ya que cambian un poco del estándar, 
  # por ejemplo, el index de campus lo encontramos en campus_index_path en 
  # lugar de campus_path, ya que este último se utilizaría para show.
end
