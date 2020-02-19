class_name PasivoCreep
extends Estado

func actualizar():
	pass

func _on_Vision_body_entered(body):
	if body.name == "Jugador":
		owner.target = body
		emit_signal("terminado", "alerta")
