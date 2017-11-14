;1
(deftemplate lenguajes
 (slot nombre
  (type STRING)
 )
 (multislot plataforma
  (type SYMBOL)
  (allowed-symbols Windows Linux Mac Solaris iOs GNU Unix Unix-Like Ubuntu)
 )
 (multislot paradigma
  (type STRING)
  (allowed-strings "Orientado a Objetos" "Imperativo" "Estructurado" "Generico" 
		   "Funcional" "Reflexivo" "Dirigido por eventos" "Basada en Prototipos"
		"Interpretado" "Procedural" "Declarativo")
 )
 (slot area-aplicacion
  (type SYMBOL)
  (allowed-symbols apps web escritorio SSOO juegos moviles optimizacion IA)
 )
 (slot cap-aprendizaje
  (type SYMBOL)
  (allowed-symbols media baja alta)
 )
 (slot cat-API
  (type SYMBOL)
  (allowed-symbols A B C D)
 )
 (multislot uso-BD
  (type SYMBOL)
  (allowed-symbols MySQL Oracle PostgreSQL Access MongoDB SQLLite SQL Server Firebird DB2 Ninguno)
; Tiene que ir aca tmb bb ,cierto
  (default Ninguno)
 )
 (slot calidad-interfaz
  (type SYMBOL)
  (allowed-symbols media baja alta Ninguna)
  (default Ninguna)
 )
)

(defrule r1
  (lenguajes 
	(nombre ?) 
	(plataforma Windows|Linux|Mac|Solaris) 
	(paradigma "Orientado a Objetos") 
	(area-aplicacion apps|web|escritorio) 
	(cap-aprendizaje media) 
	(cat-API B) 
	(uso-BD MySQL|Oracle|PostgreSQL|Access&MongoDB) 
	(calidad-interfaz alta)
  )
=>
  (printout t "Java" crlf)
)

(defrule r8
  (lenguajes 
	(nombre ?) 
	(plataforma Windows) 
	(paradigma "Orientado a Objetos") 
	(area-aplicacion web|escritorio) 
	(cap-aprendizaje baja)
	(cat-API A) 
	(uso-BD MySQL Server|MongoDB) 
	(calidad-interfaz alta)
  )
=>
  (printout t "Visual Basic.Net" crlf)
)

(defrule r9
  (lenguajes 
	(nombre ?)
	(paradigma "Imperativo"|"Estructurado") 
	(area-aplicacion SSOO|optimizacion) 
	(cap-aprendizaje alta)
	(cat-API D)
  )
=>
  (printout t "Assembly Language" crlf)
)

(defrule r10
  (lenguajes 
	(nombre ?)
	(plataforma Linux|Unix|OSx|Windows)  ;falta agregar el OSx
	(paradigma "Orientado a Objetos"|"Reflexivo") 
	(area-aplicacion web) 
	(cap-aprendizaje alta)
	(cat-API A)
	(uso-BD MySQL MySQL|PostgreSQL|MongoDB)
	(calidad-interfaz alta)
  )
=>
  (printout t "Assembly Language" crlf)
)

