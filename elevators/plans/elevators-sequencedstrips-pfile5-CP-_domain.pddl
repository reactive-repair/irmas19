(define (domain elevators-sequencedstrips)(:requirements 
:typing)(:types  agent  - object slow-elevator  fast-elevator  - agent passenger  count  status  - object)(:predicates 
(passenger-at ?person - passenger ?location - (either  count agent )) 
(lift-at ?lift - agent ?floor - count) 
(reachable-floor ?lift - agent ?floor - count) 
(above ?lift - agent ?floor1 - count ?floor2 - count) 
(passengers ?lift - agent ?n - count) 
(can-hold ?lift - agent ?n - count) 
(next ?n1 - count ?n2 - count) 
(enable-lift ?lift - agent) 
(status-door-working ?lift - agent ?n1 - count))

(:action move-up 
:parameters ( ?lift - agent ?f1 - count ?f2 - count)
:precondition (and 
(lift-at  ?lift ?f1) 
(enable-lift  ?lift) 
(above  ?lift ?f1 ?f2) 
(reachable-floor  ?lift ?f2) )
:effect (and (lift-at ?lift ?f2) (not (lift-at ?lift ?f1) ) ))

(:action move-down 
:parameters ( ?lift - agent ?f1 - count ?f2 - count)
:precondition (and 
(lift-at  ?lift ?f1) 
(enable-lift  ?lift) 
(above  ?lift ?f2 ?f1) 
(reachable-floor  ?lift ?f2) )
:effect (and (lift-at ?lift ?f2) (not (lift-at ?lift ?f1) ) ))

(:action board 
:parameters ( ?lift - agent ?p - passenger ?f - count)
:precondition (and 
(lift-at  ?lift ?f) 
(status-door-working  ?lift ?f) 
(passenger-at  ?p ?f) )
:effect (and (not (passenger-at ?p ?f) ) (passenger-at ?p ?lift) ))

(:action leave 
:parameters ( ?lift - agent ?p - passenger ?f - count)
:precondition (and 
(lift-at  ?lift ?f) 
(status-door-working  ?lift ?f) 
(passenger-at  ?p ?lift) )
:effect (and (not (passenger-at ?p ?lift) ) (passenger-at ?p ?f) )))