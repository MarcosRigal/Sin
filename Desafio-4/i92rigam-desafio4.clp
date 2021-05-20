(deffacts hechosIniciales
(casilla-actual 0 0)
(movimientos 0)
(casilla-anterior 0 0)
(direccion-anterior INICIO)
(casilla-visitada 0 0)
(puntos 10)
)

(defrule nohicenada "Inicializa el hecho hice en caso de que no exista"
	(not (hice $?))
	=>
	(assert (hice nada))
)

(defrule iniciaNumMoves
    (not (myNumMoves $?))
    =>
    (assert (myNumMoves 0))
)

(defrule volverNorthWilly "Retroceder cuando el movimiento realizado previamente fue al norte"
   (declare (salience 5))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   ?rd<-(direccion-anterior ?d)
   ?a<-(casilla-actual ?xa ?ya)
   ?p<-(casilla-anterior ?xp ?yp)
   (casilla-visitada ?xv ?yv)
   (test (eq ?xv ?xp))
   (test (eq ?xv ?xp))
   (or
   (percepts Pull)
   (percepts Pull Noise)
   (percepts Noise Pull)
   (percepts Noise)
   )
   (test (eq ?d south))
   =>
   (moveWilly north)
   (retract ?rs)
   (assert (puntos (- ?s 1)))
   (retract ?a)
   (retract ?p)
   (retract ?rd)
   (retract ?r)
   (assert (casilla-actual ?xp ?yp))
   (assert (casilla-anterior ?xa ?ya))
   (assert (direccion-anterior north))
   (assert (movimientos (+ ?m 1)))
)

(defrule volverSouthWilly "Retroceder cuando el movimiento realizado previamente fue al sur"
   (declare (salience 5))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   ?rd<-(direccion-anterior ?d)
   ?a<-(casilla-actual ?xa ?ya)
   ?p<-(casilla-anterior ?xp ?yp)
   (casilla-visitada ?xv ?yv)
   (test (eq ?xv ?xp))
   (test (eq ?xv ?xp))
   (or
   (percepts Pull)
   (percepts Pull Noise)
   (percepts Noise Pull)
   (percepts Noise)
   )
   (test (eq ?d north))
   =>
   (moveWilly south)
   (retract ?rs)
   (assert (puntos (- ?s 1)))
   (retract ?a)
   (retract ?p)
   (retract ?rd)
   (retract ?r)
   (assert (casilla-actual ?xp ?yp))
   (assert (casilla-anterior ?xa ?ya))
   (assert (direccion-anterior south))
   (assert (movimientos (+ ?m 1)))
)

(defrule volverWestWilly "Retroceder cuando el movimiento realizado previamente fue al oeste"
   (declare (salience 5))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   ?rd<-(direccion-anterior ?d)
   ?a<-(casilla-actual ?xa ?ya)
   ?p<-(casilla-anterior ?xp ?yp)
   (casilla-visitada ?xv ?yv)
   (test (eq ?xv ?xp))
   (test (eq ?xv ?xp))
   (or
   (percepts Pull)
   (percepts Pull Noise)
   (percepts Noise Pull)
   (percepts Noise)
   )
   (test (eq ?d east))
   =>
   (moveWilly west)
   (retract ?rs)
   (assert (puntos (- ?s 1)))
   (retract ?a)
   (retract ?p)
   (retract ?rd)
   (retract ?r)
   (assert (casilla-actual ?xp ?yp))
   (assert (casilla-anterior ?xa ?ya))
   (assert (direccion-anterior west))
   (assert (movimientos (+ ?m 1)))
)

(defrule volverEastWilly "Retroceder cuando el movimiento realizado previamente fue al este"
   (declare (salience 5))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   ?rd<-(direccion-anterior ?d)
   ?a<-(casilla-actual ?xa ?ya)
   ?p<-(casilla-anterior ?xp ?yp)
   (casilla-visitada ?xv ?yv)
   (test (eq ?xv ?xp))
   (test (eq ?xv ?xp))
   (or
   (percepts Pull)
   (percepts Pull Noise)
   (percepts Noise Pull)
   (percepts Noise)
   )
   (test (eq ?d west))
   =>
   (moveWilly east)
   (retract ?rs)
   (assert (puntos (- ?s 1)))
   (retract ?a)
   (retract ?p)
   (retract ?rd)
   (retract ?r)
   (assert (casilla-actual ?xp ?yp))
   (assert (casilla-anterior ?xa ?ya))
   (assert (direccion-anterior east))
   (assert (movimientos (+ ?m 1)))
)
 
(defrule fireWilly "En caso de percibir algún sonido, dispara en una dirección aleatoria"
   (hasLaser)
   (percepts $? Noise $?)
   (direccion-anterior $? ?direccion $?)
   =>
   (fireLaser ?direccion)
 )

;(defrule foundAlienCol "Encontrar dos ruidos en la misma columna"
;  (declare (salience 10))
;  (hasLaser)
;  (casilla (peligros $? Noise $?)
;      (percepts Noise)
;      (percepts Noise Pull)
;      (percepts Pull Noise)
;      (casilla-actual ?x ?y)
;   ) 
;   (casilla (peligros $? Noise $?)
;      (percepts Noise)
;      (percepts Noise Pull)
;      (percepts Pull Noise)
;      (casilla-actual ?x ?y)
;   )
;   (casilla (peligros $? Noise $?)
;      (percepts Noise)
;      (percepts Noise Pull)
;      (percepts Pull Noise)
;      (casilla-actual ?x ?y)
;   )
;   =>
;   (assert (alien ?x ?y))
;)
;
;(defrule foundAlienCol "Encontrar dos ruidos en la misma columna"
;  (declare (salience 10))
;  (hasLaser)
;  (casilla (peligros $? Noise $?)
;      (percepts Noise)
;      (percepts Noise Pull)
;      (percepts Pull Noise)
;      (casilla-actual ?x ?y)
;   ) 
;   (casilla (peligros $? Noise $?)
;      (percepts Noise)
;      (percepts Noise Pull)
;      (percepts Pull Noise)
;      (casilla-actual ?x ?y)
;   )
;   (casilla (peligros $? Noise $?)
;      (percepts Noise)
;      (percepts Noise Pull)
;      (percepts Pull Noise)
;      (casilla-actual ?x ?y)
;   )
;   =>
;   (assert (alien ?x ?y))
;)

(defrule killAlienNorth "Dispara al alien si está al norte"
   (declare (salience 20))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   (hasLaser)
   (casilla-actual ?x ?y)
   (alien-cerca ?xA ?yA)
   (or
   (percepts Noise)
   (percepts Pull Noise)
   (percepts Noise Pull)
   )
   (test (neq ?x ?xA))
   (test (neq ?y ?yA))
   (or 
   (test (eq ?xA (+ ?x 1)))
   (test (eq ?xA (- ?x 1)))
   )
   (test (eq ?yA (+ ?y 1)))
   (not (casilla-visitada ?xV&:(= ?xV ?x) ?yV&:(= ?yV (+ ?y 1))))
   =>
   (fireLaser north)
   (retract ?r)
   (assert (movimientos (+ ?m 1)))
   (retract ?rs)
   (assert (puntos (- ?s 1)))
)


(defrule killAlienSouth "Dispara al alien si está al sur"
   (declare (salience 20))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   (hasLaser)
   (casilla-actual ?x ?y)
   (alien-cerca ?xA ?yA)
   (or
   (percepts Noise)
   (percepts Pull Noise)
   (percepts Noise Pull)
   )
   (test (neq ?x ?xA))
   (test (neq ?y ?yA))
   (or
   (test (eq ?xA (+ ?x 1)))
   (test (eq ?xA (- ?x 1)))
   )
   (test (eq ?yA (- ?y 1)))
   (not (casilla-visitada ?xV&:(= ?xV ?x) ?yV&:(= ?yV (- ?y 1))))
   =>
   (fireLaser south)
   (retract ?r)
   (assert (movimientos (+ ?m 1)))
   (retract ?rs)
   (assert (puntos (- ?s 1)))
)


(defrule killAlienEast "Dispara al alien si está al este"
   (declare (salience 20))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   (hasLaser)
   (casilla-actual ?x ?y)
   (alien-cerca ?xA ?yA)
   (or
   (percepts Noise)
   (percepts Pull Noise)
   (percepts Noise Pull)
   )
   (test (neq ?x ?xA))
   (test (neq ?y ?yA))
   (or
   (test (eq ?yA (+ ?y 1)))
   (test (eq ?yA (- ?y 1)))
   )
   (test (eq ?xA (+ ?x 1)))
   (not (casilla-visitada ?xV&:(= ?xV (+ ?x 1)) ?yV&:(= ?yV ?y)))
   =>
   (fireLaser east)
   (retract ?r)
   (assert (movimientos (+ ?m 1)))
   (retract ?rs)
   (assert (puntos (- ?s 1)))
)

(defrule killAlienWest "Dispara al alien si está al oeste"
   (declare (salience 20))
   ?r<-(movimientos ?m)
   (test (< ?m 999))
   ?rs<-(puntos ?s)
   (test (> ?s 0))
   (hasLaser)
   (casilla-actual ?x ?y)
   (alien-cerca ?xA ?yA)
   (or
   (percepts Noise)
   (percepts Pull Noise)
   (percepts Noise Pull)
   )
   (test (neq ?x ?xA))
   (test (neq ?y ?yA))
   (or
   (test (eq ?yA (+ ?y 1)))
   (test (eq ?yA (- ?y 1)))
   )
   (test (eq ?xA (- ?x 1)))
   (not (casilla-visitada ?xV&:(= ?xV (- ?x 1)) ?yV&:(= ?yV ?y)))
   =>
   (fireLaser west)
   (retract ?r)
   (assert (movimientos (+ ?m 1)))
   (retract ?rs)
   (assert (puntos (- ?s 1)))
)
