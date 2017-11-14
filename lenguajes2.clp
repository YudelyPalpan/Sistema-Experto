(defrule r1
  (lenguajes 
  (plataforma Windows|Linux|Mac|Solaris) 
  (paradigma "Orientado a Objetos") 
  (area-aplicacion apps|web|escritorio) 
  (cap-aprendizaje media) 
  (cat-API B) 
  (uso-BD MySQL|Oracle|PostgreSQL|Access|MongoDB) 
  (calidad-interfaz alta)
  )
=>
  (printout t "Java" crlf)
)

(defrule r2
  (lenguajes 
        (plataforma Windows|GNU|Linux) 
        (paradigma|"Imperativo"|"Estruturado") 
        (area-aplicacion|SSOO|escritorio) 
        (cap-aprendizaje media) 
        (cat-API C) 
        (uso-BD MySQL|SQLLite|PostgreSQL|Access|MongoDB) 
        (calidad-interfaz baja)
  )
=>
  (printout t "C" crlf)
)

(defrule r3
  (lenguajes 
        (plataforma Windows|GNU|Linux) 
        (paradigma "Imperativo"|"Estruturado"|"Orientado a Objetos"|"Generico") 
        (area-aplicacion juego|escritorio) 
        (cap-aprendizaje media) 
        (cat-API C) 
        (uso-BD MySQL|SQLLite|PostgreSQL|MongoDB) 
        (calidad-interfaz media)
  )
=>
  (printout t "C++" crlf)
)

(defrule r4
  (lenguajes 
        (plataforma Windows|GNU|Linux|Unix|Android|iOS|Mac) 
        (paradigma "Imperativo"|"Estruturado"|"Orientado a Objetos"|"Generico"|"Funcional"|"Reflexivo"|"Dirigido por eventos") 
        (area-aplicacion moviles|escritorio|web) 
        (cap-aprendizaje baja) 
        (cat-API A) 
        (uso-BD MySQL|SQL Server|MongoDB|Oracle) 
        (calidad-interfaz alta)
  )
=>
  (printout t "C#" crlf)
)

(defrule r5
  (lenguajes 
        (plataforma Windows|Linux|Mac) 
        (paradigma "Imperativo"|"Orientado a Objetos"|"Funcional") 
        (area-aplicacion escritorio|web) 
        (cap-aprendizaje baja) 
        (cat-API A) 
        (uso-BD MySQL|SQL Server|MongoDB|Oracle|SQLLite|PostgreSQL) 
        (calidad-interfaz alta)
  )
=>
  (printout t "Python" crlf)
)

(defrule r6
  (lenguajes 
        (plataforma Windows|Linux|Mac|Unix) 
        (paradigma "Imperativo"|"Basada en Prototipos"|"Funcional") 
        (area-aplicacion web) 
        (cap-aprendizaje alta) 
        (cat-API B) 
        (uso-BD MySQL|MongoDB) 
        (calidad-interfaz ninguna)
  )
=>
  (printout t "JavaScript" crlf)
)

(defrule r7
  (lenguajes 
        (plataforma Windows|Unix-Like|Linux) 
        (paradigma "Imperativo"|"Orientado a Objetos"|"Funcional"|"Procedural"|"Reflexivo") 
        (area-aplicacion web) 
        (cap-aprendizaje baja) 
        (cat-API A) 
        (uso-BD MySQL|SQL Server|MongoDB|Oracle|SQLLite|PostgreSQL|DB2|Firebird) 
        (calidad-interfaz ninguna)
  )
=>
  (printout t "PHP" crlf)
)