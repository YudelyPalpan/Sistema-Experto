;1
(deftemplate carro
 (slot id
  (type SYMBOL)
 )
 (slot marca
  (type STRING)
  (allowed-strings "Toyota" "Mazda" "Renault" "Fiat" "Nissan" "Volkswagen")
 )
 (multislot color
  (type SYMBOL)
  (allowed-symbols verde azul claro rojo negro gris plata amarillo)
  (default negro)
 )
 (slot anio-fabricacion
  (type NUMBER)
  (range 1990 2017)
 )
 (multislot estado
  (type SYMBOL)
  (allowed-symbols bueno regular excelente muy malo)
  (default bueno)
 )
)

(deffacts tabla_carros
 (carro (id c1) (marca "Toyota") (color verde) (anio-fabricacion 2007) (estado bueno))
 (carro (id c2) (marca "Mazda") (color azul) (anio-fabricacion 2010) (estado regular))
 (carro (id c3) (marca "Renault") (color azul claro) (anio-fabricacion 2015) (estado excelente))
 (carro (id c4) (marca "Fiat") (color rojo) (anio-fabricacion 1995) (estado muy malo))
 (carro (id c5) (marca "Toyota") (color negro) (anio-fabricacion 2012) (estado bueno))
 (carro (id c6) (marca "Nissan") (color gris plata) (anio-fabricacion 2013) (estado regular))
 (carro (id c7) (marca "Volkswagen") (color amarillo) (anio-fabricacion 1992) (estado malo))
)

;2
(defrule ImprimeFiat
 (carro (id ?) (marca "Fiat") (color $?) (anio-fabricacion ?) (estado $?))
; (carro (id c7) (marca "Volkswagen") (color azul amarillo) (anio-fabricacion 1992) (estado malo))
=>
 (printout t "En su inventario hay al menos un Fiat" crlf)
)

;3
(defrule CarrosToyota
 (carro (id ?) (marca "Toyota") (color $?c) (anio-fabricacion ?af) (estado $?))
=>
 (printout t $?c ?af crlf)
)

;4
(defrule Carros-excelentes
 (carro (id ?) (marca ?m) (color $?c) (anio-fabricacion ?af) (estado excelente))
=>
 (printout t "marca = " ?m ", color = " $?c ", anio-fabricacion = " ?af crlf)
)

;5
;(defrule multislots
; (bind ?i 1)
; (while (<= ?i (length$ $?c)))
;  do
;   (printf (nth$ ?i $?c))
;)


;5
(defrule imprimirMultislots
 (carro (marca ?) (color ?c1 ?c2))
=>
 (printout t "si hay algun carro cuyo color se define con 2 terminos: " crlf)
 (printout t ?c1 crlf)
 (printout t ?c2 crlf)
 (printout t crlf)
)


;6
(defrule borrarNegros
 ?negro <-  (carro (id ?i) (marca ?m) (color negro) (anio-fabricacion ?af) (estado $?e))
=>
 (retract ?negro)
 (printout t id: ?i " " marca: ?m " " color: negro " " anio-fabricacion: ?af " " estado: $?e crlf)
)


