extends Estado

onready var punteria: float = 1000
var target: Enemigo

func _on_atacando(tipo: String) -> void:
	match tipo:
		"disparar_rayo":
			if apuntar():
				disparar()
		"bastonazo":
			print("dolor")
	emit_signal("terminado", "movimiento")

func apuntar() -> bool:
	var enemigos: Enemigos = owner.get_parent().get_node("Enemigos")
	
	var punteria_enemigo: float
	if enemigos.get_children().size() > 0:
		for enemigo in enemigos.get_children():
			punteria_enemigo = abs((enemigo as Enemigo).get_node("Mira").get_punteria())
			if punteria_enemigo < punteria:
				target = enemigo
				punteria = punteria_enemigo
	
	var acertado: bool = false
	if punteria <= JugadorStats.get_precision():
		acertado = true
		print("buena chunteria")
	
	punteria = 1000.0
	return acertado

func disparar() -> void:
	var rayo: RayCast2D = owner.get_node("Rayo")
	rayo.force_raycast_update()
	rayo.cast_to = target.position - owner.position
