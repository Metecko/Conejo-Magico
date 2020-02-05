extends Estado

func atacar(tipo: String) -> void:
	match tipo:
		"disparar_rayo":
			print("rayopeligroso")
		"bastonazo":
			print("dolor")
	emit_signal("terminado", "movimiento")
