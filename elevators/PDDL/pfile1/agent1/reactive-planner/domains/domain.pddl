(define (domain elevators-sequencedstrips)
(:requirements :typing :equality :fluents)
(:types agent - object
   		passenger - object
        count - object
   		option - object)
(:predicates 
	(reachable-floor ?lift - agent ?floor - count)
	(above ?lift - agent ?floor1 - count ?floor2 - count)
	
	(status-door-working ?lift - agent ?n1 - count)
)
(:constants
	YES NOT - option
)
(:functions (lift-at ?lift - agent) - count
			(passenger-at ?person - passenger) - (either count agent)
			(enable-lift ?lift - agent) - option)

(:action move-up
  :parameters (?lift - agent ?f1 - count ?f2 - count )
  :precondition (and (= (enable-lift ?lift) YES) (= (lift-at ?lift) ?f1) (above ?lift ?f1 ?f2) (reachable-floor ?lift ?f2) )
  :effect (and (assign (lift-at ?lift) ?f2)))

(:action move-down
  :parameters (?lift - agent ?f1 - count ?f2 - count )
  :precondition (and (= (lift-at ?lift) ?f1) (= (enable-lift ?lift) YES) (above ?lift ?f2 ?f1) (reachable-floor ?lift ?f2) )
  :effect (and (assign (lift-at ?lift) ?f2)))

(:action board
  :parameters (?lift - agent ?p - passenger ?f - count)
  :precondition (and  
	  (status-door-working ?lift ?f)
	  (= (passenger-at ?p) ?f)
	  (= (lift-at ?lift) ?f))
  :effect (and 
	  (assign (passenger-at ?p) ?lift)))

(:action leave 
  :parameters (?lift - agent ?p - passenger ?f - count)
  :precondition (and 
   	  (status-door-working ?lift ?f)
	  (= (passenger-at ?p) ?lift) 
	  (= (lift-at ?lift) ?f))
  :effect (and 
	  (assign (passenger-at ?p) ?f)))
)