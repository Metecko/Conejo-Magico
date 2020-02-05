class_name Quieto
extends Estado

func _ready() -> void:
	pass


func actualizar():
	if owner.movedir:
		emit_signal("terminado", "movimiento")

func wea():
	print("maraca")
