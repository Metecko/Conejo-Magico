class_name QuietoCreep
extends Estado

func actualizar():
	if owner.movedir:
		emit_signal("terminado", "movimiento")

func wea():
	print("maraca")
