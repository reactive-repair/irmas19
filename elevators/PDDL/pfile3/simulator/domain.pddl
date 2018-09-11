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

(:action F1_3_E0_N5_N7
:parameters 	()
:precondition
	(and (lift-at slow0 n5))
:effect
 	(and
		 (not (lift-at slow0 n5))
		 (lift-at slow0 n7)))

(:action F1_2_P2_N6_E1
:parameters 	()
:precondition
	(and (passenger-at p2 n6))
:effect
 	(and
		 (not (passenger-at p2 n6))
		 (passenger-at p2 slow1)))

(:action F1_4_E0
:parameters 	()
:precondition
	(and (lift-at slow0 n8))
:effect
 	(and
		 (not (enable-lift slow0))))

(:action F1_6_E0
:parameters 	()
:precondition
	(and (lift-at slow0 n5))
:effect
 	(and (not (reachable-floor slow0 n6))))

(:action F2_1_P1_N8_E1
:parameters 	()
:precondition
	(and (lift-at slow1 n7))
:effect
 	(and (not (status-door-working slow1 n7))
 		 (not (passenger-at p1 slow1))
		 (passenger-at p1 n8)))


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