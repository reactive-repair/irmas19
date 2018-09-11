(define (problem pfile1)(:domain rover)(:objects  rover0  - rover  rover1  - rover  waypoint1  - waypoint  waypoint2  - waypoint  waypoint3  - waypoint  waypoint4  - waypoint  rover0store  - store  rover1store  - store  camera0  - camera  camera1  - camera  low_res  - mode  general  - lander  objective0  - objective)(:init (visible waypoint1 waypoint2) (visible waypoint1 waypoint3) (visible waypoint1 waypoint4) (visible waypoint2 waypoint1) (visible waypoint2 waypoint3) (visible waypoint2 waypoint4) (visible waypoint3 waypoint1) (visible waypoint3 waypoint2) (visible waypoint3 waypoint4) (visible waypoint4 waypoint1) (visible waypoint4 waypoint2) (visible waypoint4 waypoint3) (at_soil_sample waypoint1) (at_soil_sample waypoint2) (at_soil_sample waypoint3) (at_soil_sample waypoint4) (at_rock_sample waypoint1) (at_rock_sample waypoint2) (at_rock_sample waypoint3) (at_rock_sample waypoint4) (equipped_for_seek rover0) (equipped_for_rock_analysis rover0) (equipped_for_soil_analysis rover0) (equipped_for_imaging rover0) (can_traverse rover0 waypoint1 waypoint2) (can_traverse rover0 waypoint1 waypoint3) (can_traverse rover0 waypoint1 waypoint4) (can_traverse rover0 waypoint2 waypoint1) (can_traverse rover0 waypoint2 waypoint3) (can_traverse rover0 waypoint2 waypoint4) (can_traverse rover0 waypoint3 waypoint1) (can_traverse rover0 waypoint3 waypoint2) (can_traverse rover0 waypoint3 waypoint4) (can_traverse rover0 waypoint4 waypoint1) (can_traverse rover0 waypoint4 waypoint2) (can_traverse rover0 waypoint4 waypoint3) (visible_from objective0 waypoint1) (visible_from objective0 waypoint2) (visible_from objective0 waypoint3) (visible_from objective0 waypoint4) (at_lander general waypoint3) (at rover0 waypoint2) (store_of rover0store rover0) (on_board camera0 rover0) (calibration_target camera0 objective0) (supports camera0 low_res) (calibration_target camera1 objective0) (supports camera1 low_res) (equipped_for_rock_analysis rover1) (equipped_for_soil_analysis rover1) (can_traverse rover1 waypoint1 waypoint2) (can_traverse rover1 waypoint1 waypoint3) (can_traverse rover1 waypoint1 waypoint4) (can_traverse rover1 waypoint2 waypoint1) (can_traverse rover1 waypoint2 waypoint3) (can_traverse rover1 waypoint2 waypoint4) (can_traverse rover1 waypoint3 waypoint1) (can_traverse rover1 waypoint3 waypoint2) (can_traverse rover1 waypoint3 waypoint4) (can_traverse rover1 waypoint4 waypoint1) (can_traverse rover1 waypoint4 waypoint2) (can_traverse rover1 waypoint4 waypoint3) (at rover1 waypoint2) (store_of rover1store rover1) (on_board camera1 rover1))(:goal (and 
(communicated_soil_data  waypoint2) 
(communicated_soil_data  waypoint1) 
(communicated_rock_data  waypoint4) 
(communicated_image_data  objective0 low_res) ) ))