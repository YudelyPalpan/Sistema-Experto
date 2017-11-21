; Template que representa al lenguaje
(deftemplate lenguajes
 (multislot plataforma
  (type SYMBOL)
  (allowed-symbols Windows Linux Android iOS macOS)
   )
 (multislot paradigma
  (type STRING)
  (allowed-strings 
        "Orientado a Objetos"
        "Estructurado" 
        "Funcional" 
        "Declarativo"
   )
  )
 (slot area-aplicacion
  (type SYMBOL)
  (allowed-symbols web escritorio juegos moviles IA)
 )
 (multislot uso-BD
  (type SYMBOL)
  (allowed-symbols 
        MySQL 
        Oracle 
        PostgreSQL 
        MongoDB 
        SQLServer 
        Ninguno
  )
  (default Ninguno)
 )
 (slot calidad-interfaz
  (type SYMBOL)
  (allowed-symbols media baja alta ninguna)
  (default ninguna)
 )
)
; Template de Capacidad de Equipo
; Representa de acuerdo a la cantidad de miembros y su experiencia
; la capacidad del equipo de desarrollo
(deftemplate cap-equipo
 (slot cantMiembros
  (type SYMBOL)
  ; A: 11 - 20 desarrolladores
  ; B: 5 - 10  desarrolladores
  ; C: 2 - 4   desarrolladores
  ; D: 1       desarrollador
  (allowed-symbols A B C D)
 )
 (slot exp
  (type SYMBOL)
  (allowed-symbols experto alta regular poca) 
 )
)
; Template de la respuesta intermedia que aun no ha recibido el filtro
; del ranking de lenguajes

(deftemplate respuesta
 (slot nombre)
 (slot ranking
  (type NUMBER)
 )
)
; Template de la respuesta final del lenguaje que ya fue filtrado por su
;ubicación en el ranking
(deftemplate r-final
 (slot nombre)
)

;*************REGLAS PARA CAPACIDAD DE EQUIPO***************

; cat-API => Categoria de API del lenguaje
; A: Muy buena, api en español, tutoriales, ejemplos
; B: Buena, api en ingles, algunos ejemplos
; C: Regular, api en ingles, pocos ejemplos, no hay muchos tutoriales
; D: Mala, api en ingles, sin ejemplos y casi ningún tutorial

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

(defrule Regla-Java
  (curva-aprendizaje media) 
  (cat-API B)
  (or 
      (lenguajes 
	   (plataforma Android) 
	   (paradigma "Orientado a Objetos") 
	   (area-aplicacion moviles) 
	   (uso-BD MongoDB|Ninguno) 
	   (calidad-interfaz ?)
	  )
	  
	  (lenguajes 
	   (plataforma Windows|Linux) 
	   (paradigma "Orientado a Objetos") 
	   (area-aplicacion web|escritorio) 
	   (uso-BD MySQL|Oracle|PostgreSQL|MongoDB|Ninguno) 
	   (calidad-interfaz ?)
	  )
	  
	  (lenguajes 
	   (plataforma macOS) 
	   (paradigma "Orientado a Objetos") 
	   (area-aplicacion web|escritorio) 
	   (uso-BD MySQL|PostgreSQL|MongoDB|Ninguno) 
	   (calidad-interfaz ?)
	  )
  )
=>
 (assert (respuesta (nombre "Java") (ranking 1)))
)


(defrule Regla-C
  (curva-aprendizaje media) 
  (cat-API C)
  (lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Estructurado") 
        (area-aplicacion escritorio) 
        (uso-BD MySQL|PostgreSQL|MongoDB|Ninguno) 
        (calidad-interfaz baja)
  )
=>
  (assert (respuesta (nombre "C") (ranking 2)))
)

(defrule Regla-CSharp
  (curva-aprendizaje media) 
  (cat-API C)
  (or (lenguajes 
        (plataforma macOS) 
        (paradigma "Estructurado"|"Orientado a Objetos"|"Funcional") 
        (area-aplicacion escritorio|web) 
        (uso-BD MySQL|SQLServer|MongoDB|Ninguno) 
        (calidad-interfaz ?)
  	  )
  	  (lenguajes 
        (plataforma Android|iOS) 
        (paradigma "Estructurado"|"Orientado a Objetos"|"Funcional") 
        (area-aplicacion moviles|escritorio|web) 
        (uso-BD MongoDB|Ninguno) 
        (calidad-interfaz ?)
  	  )
  	  (lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Estructurado"|"Orientado a Objetos"|"Funcional") 
        (area-aplicacion escritorio|web) 
        (uso-BD MySQL|SQLServer|MongoDB|Oracle|Ninguno) 
        (calidad-interfaz ?)
  	  )
  )
=>
  (assert (respuesta (nombre "C#") (ranking 4)))
)


(defrule Regla-CPlusPlus
   (curva-aprendizaje media) 
   (cat-API A)
   (lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Estructurado"|"Orientado a Objetos") 
        (area-aplicacion juegos|escritorio) 
        (uso-BD MySQL|PostgreSQL|MongoDB|Ninguno) 
        (calidad-interfaz media|baja)
   )
=>
  (assert (respuesta (nombre "C++") (ranking 3)))
)

(defrule Regla-HTML-CSS-JS
  (curva-aprendizaje alta) 
  (cat-API A)
  (lenguajes 
        (plataforma Windows|Linux|macOS) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion juegos|web) 
        (uso-BD MySQL|MongoDB|Ninguno) 
        (calidad-interfaz ?)
  )
=>
  (assert (respuesta (nombre "HTML, CSS, JavaScript") (ranking 9)))
)

(defrule Regla-Lisp
  (curva-aprendizaje media) 
  (cat-API D)
  (lenguajes 
        (plataforma Linux|Windows) 
        (paradigma "Orientado a Objetos"|"Funcional"|"Declarativo") 
        (area-aplicacion IA|juegos) 
        (uso-BD MongoDB|Ninguno) 
        (calidad-interfaz ninguna)
  )
=>
  (assert (respuesta (nombre "Lips") (ranking 13)))
)

(defrule Regla-Perl
  (curva-aprendizaje baja) 
  (cat-API C)
  (or 
   (lenguajes 
        (plataforma Linux|Windows) 
        (paradigma "Funcional"|"Orientado a Objetos") 
        (area-aplicacion web) 
        (uso-BD Oracle|MySQL|PostgreSQL|MongoDB|Ninguno)
        (calidad-interfaz ?)
   )
   (lenguajes 
        (plataforma macOS) 
        (paradigma "Funcional"|"Orientado a Objetos") 
        (area-aplicacion web) 
        (uso-BD MySQL|PostgreSQL|MongoDB|Ninguno)
        (calidad-interfaz ?)
   )
   
  )
=>
  (assert (respuesta (nombre "Perl") (ranking 10)))
)


(defrule Regla-PHP
  (curva-aprendizaje media) 
  (cat-API A)
  (or 
  	(lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion web) 
        (uso-BD MySQL|SQLServer|Oracle|PostgreSQL|Ninguno) 
        (calidad-interfaz ?)
  	)
  	(lenguajes 
        (plataforma macOS) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion web) 
        (uso-BD MySQL|PostgreSQL|Ninguno) 
        (calidad-interfaz ?)
  	)
  )
=>
  (assert (respuesta (nombre "PHP") (ranking 7)))
)


(defrule Regla-Prolog
  (curva-aprendizaje baja) 
  (cat-API B)
  (lenguajes 
        (plataforma Linux|Windows|macOS)
        (paradigma "Declarativo") 
        (area-aplicacion IA) 
        (uso-BD MySQL|Ninguno)
        (calidad-interfaz media|baja)
  )
=>
  (assert (respuesta (nombre "Prolog") (ranking 14)))
)


(defrule Regla-Python
  (curva-aprendizaje baja) 
  (cat-API A)
  (or 
  	(lenguajes 
        (plataforma Windows|Linux) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion escritorio|web|juegos|IA) 
        (uso-BD MySQL|MongoDB|PostgreSQL|Ninguno) 
        (calidad-interfaz ?)
  	)
  	(lenguajes 
        (plataforma macOS) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion escritorio|web|juegos|IA) 
        (uso-BD MySQL|MongoDB|PostgreSQL|Ninguno) 
        (calidad-interfaz ?)
  	)
  )
=>
  (assert (respuesta (nombre "Python") (ranking 5)))
)

(defrule Regla-Ruby
  (curva-aprendizaje baja) 
  (cat-API A)
  (lenguajes 
        (plataforma Linux|macOS|Windows) 
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion web) 
        (uso-BD  MySQL|PostgreSQL|MongoDB|Ninguno)
        (calidad-interfaz ?)
  )
=>
  (assert (respuesta (nombre "Ruby") (ranking 11)))
)

(defrule Regla-Scala
  (curva-aprendizaje alta) 
  (cat-API A)
  (lenguajes 
        (plataforma Linux|Windows|macOS)  
        (paradigma "Funcional"|"Orientado a Objetos") 
        (area-aplicacion web) 
        (uso-BD MySQL|MongoDB|Ninguno)
        (calidad-interfaz ?)
  )
=>
  (assert (respuesta (nombre "Scala") (ranking 12)))
)



(defrule  Regla-VBNet
  (curva-aprendizaje alta) 
  (cat-API A)
  (lenguajes 
        (plataforma Windows)
        (paradigma "Orientado a Objetos") 
        (area-aplicacion web|escritorio) 
        (uso-BD SQLServer|Oracle|Ninguno) 
        (calidad-interfaz ?)
  )
=>
  (assert (respuesta (nombre "Visual Basic.Net") (ranking 8)))
)

(defrule Regla-Swift
  (curva-aprendizaje baja) 
  (cat-API A)
  (lenguajes 
        (plataforma iOS|macOS|Linux)
        (paradigma "Orientado a Objetos"|"Funcional") 
        (area-aplicacion moviles) 
        (uso-BD MySQL|MongoDB|Ninguno) 
        (calidad-interfaz ?)
  )
=>
  (assert (respuesta (nombre "Swift") (ranking 6)))
)

(deffunction comp-ranking (?fact1 ?fact2)
   (< (fact-slot-value ?fact1 ranking) (fact-slot-value ?fact2 ranking)))

(deffunction find-max (?template ?predicate)
   (bind ?max FALSE)
   (do-for-all-facts ((?f ?template)) TRUE
      (if (or (not ?max) (funcall ?predicate ?f ?max))
         then
         (bind ?max ?f)))
   (return ?max))

(defrule find-max
   =>
   (bind ?respuesta (find-max respuesta comp-ranking))
   (if ?respuesta
      then
      (assert (r-final (nombre (fact-slot-value ?respuesta nombre)))))
)

;(deffacts prueba1
; (cap-equipo (cantMiembros A) (exp experto))
; (lenguajes (plataforma Windows) (paradigma "Orientado a Objetos") (area-aplicacion web) (uso-BD MongoDB) (calidad-interfaz alta))
;)
