(define (domain rover)
(:requirements :typing :negative-preconditions)
(:types agent waypoint store camera mode lander objective - object
 		rover - agent)

(:predicates (at ?r - rover ?y - waypoint) 
             (at_lander ?x - lander ?y - waypoint)
             (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
	    	 (equipped_for_seek ?r - rover)
	     	 (equipped_for_soil_analysis ?r - rover)
             (equipped_for_rock_analysis ?r - rover)
             (equipped_for_imaging ?r - rover)
             (equipped_for_com_rover_to_rover ?r - rover)

             (have_rock_analysis ?r - rover ?w - waypoint)
             (have_soil_analysis ?r - rover ?w - waypoint)
	     	 (calibrated ?c - camera ?r - rover) 
	         (supports ?c - camera ?m - mode)
             (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)
             (have_image ?r - rover ?o - objective ?m - mode)
             (communicated_soil_data ?w - waypoint)
             (communicated_rock_data ?w - waypoint)
             (communicated_image_data ?o - objective ?m - mode)
	         (at_soil_sample ?w - waypoint)
	     	 (at_rock_sample ?w - waypoint)
             (visible_from ?o - objective ?w - waypoint)
	     	 (store_of ?s - store ?r - rover)
	     	 (calibration_target ?i - camera ?o - objective)
	     	 (on_board ?i - camera ?r - rover)
	     
)

; Sensors of each rover - necessary for the simulator
(:sensor allRovers
	     	 (at ?r - rover ?y - waypoint) 
             (at_lander ?x - lander ?y - waypoint)
             (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
	    	 (equipped_for_seek ?r - rover)
	     	 (equipped_for_soil_analysis ?r - rover)
             (equipped_for_rock_analysis ?r - rover)
             (equipped_for_imaging ?r - rover)
             (equipped_for_com_rover_to_rover ?r - rover)
             
             (have_rock_analysis ?r - rover ?w - waypoint)
             (have_soil_analysis ?r - rover ?w - waypoint)
	     	 (calibrated ?c - camera ?r - rover) 
	     	 (supports ?c - camera ?m - mode)
             (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)
             (have_image ?r - rover ?o - objective ?m - mode)
             (communicated_soil_data ?w - waypoint)
             (communicated_rock_data ?w - waypoint)
             (communicated_image_data ?o - objective ?m - mode)
	     	 (at_soil_sample ?w - waypoint)
	      	 (at_rock_sample ?w - waypoint)
             (visible_from ?o - objective ?w - waypoint)
	     	 (store_of ?s - store ?r - rover)
	     	 (calibration_target ?i - camera ?o - objective)
	     	 (on_board ?i - camera ?r - rover)
)

; Sensors of each rover - necessary for the simulator
(:sensor allRoversNoImage
	     	 (at ?r - rover ?y - waypoint) 
             (at_lander ?x - lander ?y - waypoint)
             (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
	    	 (equipped_for_seek ?r - rover)
	     	 (equipped_for_soil_analysis ?r - rover)
             (equipped_for_rock_analysis ?r - rover)
             (equipped_for_imaging ?r - rover)
             (equipped_for_com_rover_to_rover ?r - rover)
             
             (have_rock_analysis ?r - rover ?w - waypoint)
             (have_soil_analysis ?r - rover ?w - waypoint)
	     	 (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)
             (communicated_soil_data ?w - waypoint)
             (communicated_rock_data ?w - waypoint)
             (at_soil_sample ?w - waypoint)
	      	 (at_rock_sample ?w - waypoint)
             (store_of ?s - store ?r - rover)
)

(:action add_capabilities
:parameters 	()
:precondition
	(and
		(equipped_for_seek rover0)
	)
:effect
 	(and
		(equipped_for_com_rover_to_rover rover0)
		(equipped_for_com_rover_to_rover rover1)
	)
)


(:action failure_1_r0_1
:parameters 	()
:precondition
	(and
		(can_traverse rover0 waypoint1 waypoint6)
	)
:effect
 	(and
		(not (can_traverse rover0 waypoint1 waypoint6))
	)
)

(:action failure_1_r2_1
:parameters 	()
:precondition
	(and
		(calibrated camera2 rover2) 
		(visible_from objective2 waypoint2)
	)
:effect
 	(and
		(not (calibrated camera2 rover2))
		(not (visible_from objective2 waypoint2))
	)
)

(:action F21_r0_r2
:parameters 	()
:precondition
	(and
		(can_traverse rover0 waypoint1 waypoint6)
		(calibrated camera2 rover2) 
		(visible_from objective2 waypoint2)
	)
:effect
 	(and
		(not (can_traverse rover0 waypoint1 waypoint6))
		(not (calibrated camera2 rover2))
		(not (visible_from objective2 waypoint2))
	)
)

(:action F4_R3_SOIL_W3
:parameters 	()
:precondition
	(and
		(have_soil_analysis rover3 waypoint3)
	)
:effect
 	(and
		(not (have_soil_analysis rover3 waypoint3))
	)
)

(:action F1_R3_W3_W2
:parameters 	()
:precondition
	(and
		(can_traverse rover3 waypoint3 waypoint2)
	)
:effect
 	(and
		(not (can_traverse rover3 waypoint3 waypoint2))
	)
)

(:action failure_1_r1_2
:parameters 	()
:precondition
	(and
		(at_rock_sample waypoint5)
	)
:effect
 	(and
		(not (at_rock_sample waypoint5))
	)
)


(:action failure_1_r3_2
:parameters 	()
:precondition
	(and
		(can_traverse rover3 waypoint7 waypoint3)
		(at_soil_sample waypoint3)
	)
:effect
 	(and
		(not (can_traverse rover3 waypoint7 waypoint3))
		(not (at_soil_sample waypoint3))
	)
)


(:action F22_r1_r3
:parameters 	()
:precondition
	(and
		(at_rock_sample waypoint5)
		(can_traverse rover3 waypoint7 waypoint3)
		(at_soil_sample waypoint3)
	)
:effect
 	(and
		(not (at_rock_sample waypoint5))
		(not (can_traverse rover3 waypoint7 waypoint3))
		(not (at_soil_sample waypoint3))
	)
)



(:action F1_R3_W7_W3
:parameters 	()
:precondition
	(and
		(can_traverse rover3 waypoint7 waypoint3)
	)
:effect
 	(and
		(not (can_traverse rover3 waypoint7 waypoint3))
	)
)

(:action F13_R1_ROCk_W4
:parameters 	()
:precondition
	(and
		(have_rock_analysis rover1 waypoint5)
	)
:effect
 	(and
		(not (have_rock_analysis rover1 waypoint5))
		(not (equipped_for_seek rover1))
	)
)


(:action F11_R1_ROCK_W5
:parameters 	()
:precondition
	(and
		(at_rock_sample waypoint5)
	)
:effect
 	(and
		(not (at_rock_sample waypoint5))
		(not (equipped_for_seek rover1))
	)
)

(:action F1_R3_W3_W5
:parameters 	()
:precondition
	(and
		(can_traverse rover3 waypoint3 waypoint5)
	)
:effect
 	(and
		(not (can_traverse rover3 waypoint3 waypoint5))
	)
)

(:action F4_R1_W5
:parameters 	()
:precondition
	(and
		(have_rock_analysis rover1 waypoint5)
	)
:effect
 	(and
		(not (have_rock_analysis rover1 waypoint5))
	)
)

(:action F6_R2
:parameters 	()
:precondition
	(and
		(equipped_for_imaging rover2)
	)
:effect
 	(and
		(not (equipped_for_imaging rover2))
	)
)

(:action F9_R1_ROCK
:parameters 	()
:precondition
	(and
		(at_rock_sample waypoint5)
	)
:effect
 	(and
		(not (equipped_for_rock_analysis rover1))
	)
)

(:action F10_R0
:parameters 	()
:precondition
	(and
		(at_soil_sample waypoint6)
	)
:effect
 	(and
		(not (at_soil_sample waypoint6))
	)
)

(:action F20_R1_W5
:parameters 	()
:precondition
	(and
		(have_rock_analysis rover1 waypoint5)
	)
:effect
 	(and
		(not (have_rock_analysis rover1 waypoint5))
		(not (equipped_for_rock_analysis rover1))
		(not (equipped_for_soil_analysis rover1))
	)
)

(:action failure_2_r3_2
:parameters 	()
:precondition
	(and
		(have_soil_analysis rover3 waypoint3)
		(equipped_for_soil_analysis rover3)
	)
:effect
 	(and
		(not (have_soil_analysis rover3 waypoint3))
		(not (equipped_for_soil_analysis rover3))
	)
)

(:action failure_2_r2_3
:parameters 	()
:precondition
	(and
		(can_traverse rover2 waypoint3 waypoint2)
	)
:effect
 	(and
		(not (can_traverse rover2 waypoint3 waypoint2))
	)
)



(:action failure_3_r3_1
:parameters 	()
:precondition
	(and
		(can_traverse rover3 waypoint7 waypoint3)
	)
:effect
 	(and
		(not (can_traverse rover3 waypoint7 waypoint3))
	)
)

(:action failure_3_r1_2
:parameters 	()
:precondition
	(and
		(have_rock_analysis rover1 waypoint5)
		(equipped_for_rock_analysis rover1)
	)
:effect
 	(and
		(not (have_rock_analysis rover1 waypoint5))
		(not (equipped_for_rock_analysis rover1))
	)
)


(:action failure_3_r0_3
:parameters 	()
:precondition
	(and
		(have_soil_analysis rover0 waypoint6)
		(equipped_for_soil_analysis rover0)
	)
:effect
 	(and
		(not (have_soil_analysis rover0 waypoint6))
		(not (equipped_for_soil_analysis rover0))
		(at_soil_sample waypoint6)
	)
)

(:action failure_3_r0_4
:parameters 	()
:precondition
	(and
		(have_soil_analysis rover0 waypoint6)
		(equipped_for_soil_analysis rover0)
	)
:effect
 	(and
		(not (have_soil_analysis rover0 waypoint6))
		(not (equipped_for_soil_analysis rover0))
		(not (equipped_for_soil_analysis rover2))
		(at_soil_sample waypoint6)
	)
)





(:action failure_rover0_1_2
:parameters 	()
:precondition
	(and
		(can_traverse rover1 waypoint4 waypoint3)
	)
:effect
 	(and
		(not (can_traverse rover1 waypoint4 waypoint3))
	)
)

(:action failure_rover0_2
:parameters 	()
:precondition
	(and
		(at_soil_sample waypoint3)
	)
:effect
 	(and
		(not (at_soil_sample waypoint3))
		(not (equipped_for_rock_analysis rover0))
		(not (equipped_for_soil_analysis rover0))
	)
)

(:action failure_rover0_3
:parameters 	()
:precondition
	(and
		(have_soil_analysis rover0 waypoint3)
	)
:effect
 	(and
		(not (have_soil_analysis rover0 waypoint3))
	)
)

(:action failure_rover0_5
:parameters 	()
:precondition
	(and
		(equipped_for_imaging rover0)
	)
:effect
 	(and
		(not (equipped_for_imaging rover0))
	)
)

(:action failure_rover0_6
:parameters 	()
:precondition
	(and
		(calibrated camera1 rover0) 
	)
:effect
 	(and
		(not (calibrated camera1 rover0))
	)
)

(:action failure_rover0_7
:parameters 	()
:precondition
	(and
		(visible_from objective1 waypoint3)
	)
:effect
 	(and
		(not (visible_from objective1 waypoint3))
	)
)

(:action failure_rover0_4
:parameters 	()
:precondition
	(and
		;(can_traverse rover0 waypoint1 waypoint2)
		(can_traverse rover0 waypoint1 waypoint3)
		(can_traverse rover0 waypoint3 waypoint4)
		;(can_traverse rover1 waypoint2 waypoint1)
		;(can_traverse rover1 waypoint2 waypoint3)
		;(can_traverse rover1 waypoint2 waypoint4)
		;(can_traverse rover1 waypoint3 waypoint1)
		;(can_traverse rover1 waypoint3 waypoint2)
		;(can_traverse rover1 waypoint3 waypoint4)
		;(can_traverse rover1 waypoint4 waypoint1)
		;(can_traverse rover1 waypoint4 waypoint2)
		;(can_traverse rover1 waypoint4 waypoint3)
	)
:effect
 	(and
		(not (can_traverse rover0 waypoint3 waypoint4))
		(not (can_traverse rover0 waypoint1 waypoint3))
		;(not (can_traverse rover0 waypoint1 waypoint2))
	)
)

(:action failure_rover1_4
:parameters 	()
:precondition
	(and
		;(can_traverse rover0 waypoint1 waypoint2)
		(can_traverse rover1 waypoint1 waypoint2)
		(can_traverse rover1 waypoint2 waypoint4)
		;(can_traverse rover1 waypoint2 waypoint1)
		;(can_traverse rover1 waypoint2 waypoint3)
		;(can_traverse rover1 waypoint2 waypoint4)
		;(can_traverse rover1 waypoint3 waypoint1)
		;(can_traverse rover1 waypoint3 waypoint2)
		;(can_traverse rover1 waypoint3 waypoint4)
		;(can_traverse rover1 waypoint4 waypoint1)
		;(can_traverse rover1 waypoint4 waypoint2)
		;(can_traverse rover1 waypoint4 waypoint3)
	)
:effect
 	(and
		(not (can_traverse rover1 waypoint2 waypoint4))
		(not (can_traverse rover1 waypoint1 waypoint2))
		;(not (can_traverse rover0 waypoint1 waypoint2))
	)
)

(:action failure_rover1_4_2
:parameters 	()
:precondition
	(and
		(at_soil_sample waypoint4)
	)
:effect
 	(and
		(not (at_soil_sample waypoint4))
	)
)

(:action failure_rover1_4_3
:parameters 	()
:precondition
	(and
		(at_soil_sample waypoint2)
	)
:effect
 	(and
		(not (at_soil_sample waypoint2))
		(not (equipped_for_rock_analysis rover1))
		(not (equipped_for_soil_analysis rover1))
	)
)

(:action failure_rover1_4_4
:parameters 	()
:precondition
	(and
		(have_soil_analysis rover1 waypoint4)
		(at rover1 waypoint4)
	)
:effect
 	(and
		(not (have_soil_analysis rover1 waypoint4))
		(not (equipped_for_rock_analysis rover1))
		(not (equipped_for_soil_analysis rover1))
	)
)


(:action failure_rover1_2
:parameters 	()
:precondition
	(and
		(have_rock_analysis rover1 waypoint4)
	)
:effect
 	(and
		(not (have_rock_analysis rover1 waypoint4))
	)
)



(:action seek_rocks
 :parameters (?r - rover ?w - waypoint)
 :precondition (and 
	(equipped_for_seek ?r)
	;(not (at_rock_sample ?w))
   	(at ?r ?w))
 :effect (and (at_rock_sample ?w))
)

(:action seek_soils
 :parameters (?r - rover ?w - waypoint)
 :precondition (and 
	(equipped_for_seek ?r)
;	(not (at_soil_sample ?w))
	(at ?r ?w))
 :effect (and (at_soil_sample ?w))
)
	
(:action navigate
:parameters (?r - rover ?y - waypoint ?z - waypoint) 
:precondition (and (can_traverse ?r ?y ?z) (at ?r ?y) 
	    )
:effect (and (not (at ?r ?y)) (at ?r ?z)
		)
)

(:action sample_soil
:parameters (?r - rover ?s - store ?p - waypoint)
:precondition (and 
(at ?r ?p) (at_soil_sample ?p) 
(equipped_for_soil_analysis ?r) (store_of ?s ?r) 
		)
:effect (and 
(have_soil_analysis ?r ?p) (not (at_soil_sample ?p))
		)
)

(:action sample_rock
:parameters (?r - rover ?s - store ?p - waypoint)
:precondition (and (at ?r ?p) (at_rock_sample ?p) 
(equipped_for_rock_analysis ?r) (store_of ?s ?r)
		)
:effect (and (have_rock_analysis ?r ?p) 
(not (at_rock_sample ?p))
)
)


(:action calibrate
 :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint)
 :precondition (and (equipped_for_imaging ?r) 
 (calibration_target ?i ?t) 
 (at ?r ?w) (visible_from ?t ?w)(on_board ?i ?r)
		)
 :effect (calibrated ?i ?r) 
)


(:action take_image
 :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
 :precondition (and (calibrated ?i ?r)
			 (on_board ?i ?r)
                      (equipped_for_imaging ?r)
                      (supports ?i ?m)
			  (visible_from ?o ?p)
                     (at ?r ?p)
               )
 :effect (and (have_image ?r ?o ?m)(not (calibrated ?i ?r))
		)
)

(:action communicate_soil_data
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)
 (at_lander ?l ?y)(have_soil_analysis ?r ?p) 
                   (visible ?x ?y)
            )
 :effect (and 
		(communicated_soil_data ?p)
	)
)

(:action comm_rover_soil_data
 :parameters 	(?r - rover ?r2 - rover ?p - waypoint ?w - waypoint)
 :precondition
 	(and
 		(at ?r ?w)
		(have_soil_analysis ?r ?p)
		(equipped_for_com_rover_to_rover ?r)
        )
 :effect
 	(and
		(not (have_soil_analysis ?r ?p))
		(have_soil_analysis ?r2 ?p)
	)
)

(:action communicate_rock_data
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(at_lander ?l ?y)(have_rock_analysis ?r ?p)
                   (visible ?x ?y)
            )
 :effect (and (communicated_rock_data ?p)
          )
)

(:action comm_rover_rock_data
 :parameters 	(?r - rover ?r2 - rover ?p - waypoint ?w - waypoint)
 :precondition
 	(and
 		(at ?r ?w)
		(have_rock_analysis ?r ?p)
		(equipped_for_com_rover_to_rover ?r)
        )
 :effect
 	(and
		(not (have_rock_analysis ?r ?p))
		(have_rock_analysis ?r2 ?p)
	)
)

(:action comm_rover_image_data
 :parameters 	(?r - rover ?r2 - rover ?o - objective ?m - mode ?w - waypoint)
 :precondition
 	(and
 		(at ?r ?w)
		(have_image ?r ?o ?m)
		(equipped_for_com_rover_to_rover ?r)
        )
 :effect
 	(and
		(not (have_image ?r ?o ?m))
		(have_image ?r2 ?o ?m)
	)
)

(:action communicate_image_data
 :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(at_lander ?l ?y)(have_image ?r ?o ?m)(visible ?x ?y)
            )
 :effect (and (communicated_image_data ?o ?m)
          )
))