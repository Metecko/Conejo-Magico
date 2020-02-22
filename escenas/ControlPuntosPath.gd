extends Area2D
class_name ControlPuntosPath

func set_radio_enemigo(radio: int) -> void:
	$CollisionShape2D.shape.radius = radio

func print_colisiones() -> String:
	yield()
	queue_free()
	return "peo"
