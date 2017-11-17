(deftemplate lenguajes
 (multislot plataforma
  (type SYMBOL)
  (allowed-symbols Windows Linux Android Mac Solaris iOS Unix Unix-Like Ubuntu OSx)
   )
 (multislot paradigma
  (type STRING)
  (allowed-strings 
        "Orientado a Objetos"
        "Estructurado" 
        "Funcional" 
        "Declarativo"
        "Reflexivo" 
        "Dirigido por eventos" 
        "Basada en Prototipos"
        "Procedural" 
   )
  )
 (slot area-aplicacion
  (type SYMBOL)
  (allowed-symbols web escritorio SSOO juegos moviles IA)
 )
 (multislot uso-BD
  (type SYMBOL)
  (allowed-symbols 
        MySQL 
        Oracle 
        PostgreSQL 
        MongoDB 
        SQLServer 
        Firebird  
        Ninguno
  )
  (default Ninguno)
 )
 (slot calidad-interfaz
  (type SYMBOL)
  (allowed-symbols      media 
                        baja 
                        alta 
                        ninguna)
  (default ninguna)
 )
)

(deftemplate cap-equipo
 (slot cantMiembros
  (type SYMBOL)
  (allowed-symbols A B C D)
 )
 (slot exp
  (type SYMBOL)
  (allowed-symbols experto alta regular poca) 
 )
)

(deftemplate respuesta
 (slot nombre)
)

;*************REGLAS PARA CAPACIDAD DE EQUIPO***************

(defrule Regla1-CapEquipo
 (cap-equipo (cantMiembros A) (exp experto))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (cat-API C)
    (cat-API D)
    (curva-aprendizaje alta)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla2-CapEquipo
 (cap-equipo (cantMiembros A) (exp alta))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (cat-API C)
    (curva-aprendizaje alta)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla3-CapEquipo
 (cap-equipo (cantMiembros A) (exp regular))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla4-CapEquipo
 (cap-equipo (cantMiembros A) (exp poca))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje baja)
   )
)

(defrule Regla5-CapEquipo
 (cap-equipo (cantMiembros B) (exp experto))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (cat-API C)
    (cat-API D)
    (curva-aprendizaje alta)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla6-CapEquipo
 (cap-equipo (cantMiembros B) (exp alta))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (curva-aprendizaje alta)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla7-CapEquipo
 (cap-equipo (cantMiembros B) (exp regular))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla8-CapEquipo
 (cap-equipo (cantMiembros B) (exp poca))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje baja)
   )
)

(defrule Regla9-CapEquipo
 (cap-equipo (cantMiembros C) (exp experto))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (curva-aprendizaje alta)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla10-CapEquipo
 (cap-equipo (cantMiembros C) (exp alta))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla11-CapEquipo
 (cap-equipo (cantMiembros C) (exp regular))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla12-CapEquipo
 (cap-equipo (cantMiembros C) (exp poca))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje baja)
   )
)

(defrule Regla13-CapEquipo
 (cap-equipo (cantMiembros D) (exp experto))
=>
  (assert 
    (cat-API A)
    (cat-API B)
    (curva-aprendizaje alta)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla14-CapEquipo
 (cap-equipo (cantMiembros D) (exp alta))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje media)
    (curva-aprendizaje baja)
   )
)

(defrule Regla15-CapEquipo
 (cap-equipo (cantMiembros D) (exp regular))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje baja)
   )
)

(defrule Regla16-CapEquipo
 (cap-equipo (cantMiembros D) (exp poca))
=>
  (assert 
    (cat-API A)
    (curva-aprendizaje baja)
   )
)

;***************REGLAS PARA LENGUAJE DE PROGRAMACION***************

(defrule Regla1-Lenguaje
  (curva-aprendizaje media) 
  (cat-API B)
  (lenguajes 
   (plataforma Windows|Linux|Mac|Solaris) 
   (paradigma "Orientado a Objetos") 
   (area-aplicacion web|escritorio) 
   (uso-BD MySQL|Oracle|PostgreSQL|MongoDB|Ninguno) 
   (calidad-interfaz alta)
  )
=>
 (assert (nombre "Java"))
)

(defrule Regla2-Lenguaje
 (curva-aprendizaje alta) 
 (cat-API D)
 (lenguajes
        (paradigma "Declarativo") 
        (area-aplicacion SSOO) 
  )
=>
  (assert (respuesta (nombre "Assembly Language")))
)


(defrule Regla3-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API C)
  (lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Estructurado") 
        (area-aplicacion SSOO|escritorio) 
        (uso-BD MySQL|PostgreSQL|MongoDB) 
        (calidad-interfaz baja)
  )
=>
  (assert (respuesta (nombre "C")))
)

(defrule Regla4-Lenguaje
  (curva-aprendizaje alta) 
  (cat-API A)
  (lenguajes 
        (plataforma Windows|Linux|Android|Unix|iOS|Mac) 
        (paradigma "Estructurado"|"Orientado a Objetos"|"Funcional"|"Reflexivo"|"Dirigido por eventos") 
        (area-aplicacion moviles|escritorio|web) 
        (uso-BD MySQL|SQLServer|MongoDB|Oracle) 
        (calidad-interfaz alta)
  )
=>
  (assert (respuesta (nombre "C#")))
)


(defrule Regla5-Lenguaje
   (curva-aprendizaje baja) 
   (cat-API C)
   (lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Estructurado"|"Orientado a Objetos") 
        (area-aplicacion juegos|escritorio) 
        (uso-BD MySQL|PostgreSQL|MongoDB) 
        (calidad-interfaz media)
   )
=>
  (assert (respuesta (nombre "C++")))
)

(defrule Regla6-Lenguaje
  (curva-aprendizaje alta) 
  (cat-API B)
  (lenguajes 
        (plataforma Windows|Linux|Mac|Unix) 
        (paradigma "Basada en Prototipos"|"Funcional") 
        (area-aplicacion web) 
        (uso-BD MySQL|MongoDB) 
        (calidad-interfaz ninguna)
  )
=>
  (assert (respuesta (nombre "JavaScript")))
)

(defrule Regla7-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API D)
  (lenguajes 
        (plataforma Ubuntu|Windows) 
        (paradigma "Orientado a Objetos"|"Funcional"|"Declarativo") 
        (area-aplicacion IA|juegos) 
        (uso-BD MongoDB) 
        (calidad-interfaz ninguna)
  )
=>
  (assert (respuesta (nombre "Lips")))
)

(defrule  Regla8-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API C)
  (lenguajes 
        (plataforma Linux|Windows|OSx) 
        (paradigma "Funcional"|"Orientado a Objetos"|"Reflexivo"|"Procedural"|"Dirigido por eventos") 
        (area-aplicacion web) 
        (uso-BD Oracle|MySQL|PostgreSQL|MongoDB)
        (calidad-interfaz alta)
  )
=>
  (assert (respuesta (nombre "Perl")))
)


(defrule  Regla9-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API A)
  (lenguajes 
        (plataforma Windows|Unix-Like) 
        (paradigma "Orientado a Objetos"|"Funcional"|"Procedural"|"Reflexivo") 
        (area-aplicacion web) 
        (uso-BD MySQL|SQLServer|Oracle|PostgreSQL|Firebird) 
        (calidad-interfaz ninguna)
  )
=>
  (assert (respuesta (nombre "PHP")))
)


(defrule  Regla10-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API B)
  (lenguajes 
        (plataforma Linux|Windows|OSx)  ;falta agregar el OSx
        (paradigma "Declarativo") 
        (area-aplicacion IA) 
        (uso-BD MySQL)
        (calidad-interfaz media)
  )
=>
  (assert (respuesta (nombre "Prolog")))
)


(defrule  Regla11-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API A)
  (lenguajes 
        (plataforma Windows|Linux|Mac) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion escritorio|web) 
        (uso-BD MySQL|MongoDB|Oracle|PostgreSQL) 
        (calidad-interfaz alta)
  )
=>
  (assert (respuesta (nombre "Python")))
)

(defrule  Regla12-Lenguaje
  (curva-aprendizaje alta) 
  (cat-API A)
  (lenguajes 
        (plataforma Linux|Unix|OSx|Windows) 
        (paradigma "Orientado a Objetos"|"Reflexivo") 
        (area-aplicacion web) 
        (uso-BD  MySQL|PostgreSQL|MongoDB)
        (calidad-interfaz alta)
  )
=>
  (assert (respuesta (nombre "Ruby")))
)



(defrule Regla13-Lenguaje
  (curva-aprendizaje alta) 
  (cat-API A)
  (lenguajes 
        (plataforma Mac|Unix|Windows|OSx)  
        (paradigma "Funcional"|"Orientado a Objetos") 
        (area-aplicacion web) 
        (uso-BD MySQL MongoDB)
        (calidad-interfaz alta)
  )
=>
  (assert (respuesta (nombre "Scala")))
)



(defrule  Regla14-Lenguaje
  (curva-aprendizaje baja) 
  (cat-API A)
  (lenguajes 
        (plataforma Windows) 
        (paradigma "Orientado a Objetos") 
        (area-aplicacion web|escritorio) 
        (uso-BD MySQL|MongoDB) 
        (calidad-interfaz alta)
  )
=>
  (assert (respuesta (nombre "Visual Basic.Net")))
)


(deffacts prueba1
 (cap-equipo (cantMiembros B) (exp alta))
 (lenguajes (plataforma Linux) (paradigma "Orientado a Objetos") (area-aplicacion web) (uso-BD Oracle) (calidad-interfaz alta))
)

