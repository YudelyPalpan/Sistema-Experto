(deftemplate color
 (slot nombre)
)

(defrule color-combina
 (color (nombre azul))
=>
 (printout t "El color que convina es el morado" crlf)
 (assert (color (nombre morado)))
)