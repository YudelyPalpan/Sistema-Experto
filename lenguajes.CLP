(deftemplate lenguajes
 (multislot plataforma
  (type SYMBOL)
  (allowed-symbols Windows Linux Mac Solaris iOS GNU Unix Unix-Like Ubuntu)
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
  (allowed-symbols media baja alta ninguna)
  (default Ninguna)
 )
)