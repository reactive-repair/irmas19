(define (domain elevators-sequencedstrips)
  (:requirements :typing)
  (:types 	agent - object
			slow-elevator fast-elevator - agent
   			passenger - object
          	count - object
   			status - object
  )
(:predicates 
	(passenger-at ?person - passenger ?location - (either count agent))
	(lift-at ?lift - agent ?floor - count)
	(reachable-floor ?lift - agent ?floor - count)
	(above ?lift - agent ?floor1 - count ?floor2 - count)
	
	(enable-lift ?lift - agent)
	(status-door-working ?lift - agent ?n1 - count)
)

; Sensors of each elevator - necessary for the simulator
(:sensor allElevators
	(passenger-at ?person - passenger ?location - (either count agent))
	(lift-at ?lift - agent ?floor - count)
	(reachable-floor ?lift - agent ?floor - count)
	(above ?lift - agent ?floor1 - count ?floor2 - count)
	
	(enable-lift ?lift - agent)
	(status-door-working ?lift - agent ?n1 - count)
)

(:action F1_1_P2_N2_N3
:parameters 	()
:precondition
	(and (passenger-at p2 n2))
:effect
 	(and
		 (not (passenger-at p2 n2))
		 (passenger-at p2 n3)))

(:action F1_2_P2_N2_E0
:parameters 	()
:precondition
	(and (passenger-at p2 n2))
:effect
 	(and
		 (not (passenger-at p2 n2))
		 (passenger-at p2 slow0)))

(:action F1_4_E0
:parameters 	()
:precondition
	(and (lift-at slow0 n8))
:effect
 	(and
		 (not (enable-lift slow0))))

(:action F1_5_E0
:parameters 	()
:precondition
	(and (lift-at slow0 n8))
:effect
 	(and (not (status-door-working slow0 n8))))

(:action F2_1_P0_n3_E0
:parameters 	()
:precondition
	(and (lift-at slow0 n4))
:effect
 	(and (not (status-door-working slow0 n4))
 		 (not (passenger-at p0 slow0))
		 (passenger-at p0 n3)))


(:action move-up
  :parameters (?lift - agent ?f1 - count ?f2 - count )
  :precondition (and (lift-at ?lift ?f1) (enable-lift ?lift) (above ?lift ?f1 ?f2 ) (reachable-floor ?lift ?f2) )
  :effect (and (lift-at ?lift ?f2) (not (lift-at ?lift ?f1))))

(:action move-down
  :parameters (?lift - agent ?f1 - count ?f2 - count )
  :precondition (and (lift-at ?lift ?f1) (enable-lift ?lift) (above ?lift ?f2 ?f1 ) (reachable-floor ?lift ?f2) )
  :effect (and (lift-at ?lift ?f2) (not (lift-at ?lift ?f1))))

(:action board
  :parameters (?lift - agent ?p - passenger ?f - count)
  :precondition (and  (lift-at ?lift ?f) (status-door-working ?lift ?f) (passenger-at ?p ?f))
  :effect (and (not (passenger-at ?p ?f)) (passenger-at ?p ?lift)))

(:action leave 
  :parameters (?lift - agent ?p - passenger ?f - count)
  :precondition (and  (lift-at ?lift ?f) (status-door-working ?lift ?f) (passenger-at ?p ?lift))
  :effect (and (not (passenger-at ?p ?lift)) (passenger-at ?p ?f))) 
)