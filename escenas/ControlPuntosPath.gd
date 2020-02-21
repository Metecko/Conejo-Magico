extends Node2D
class_name ControlPuntosPath



	
func _process(delta):
	print($Area2D.get_overlapping_bodies())
