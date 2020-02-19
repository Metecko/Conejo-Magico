class_name AgresivoCreep
extends Estado

onready var perspectiva: RayCast2D = owner.get_node("RayCastVision")
var observado
var es_jugador = false

func actualizar():
	
	if mirar_target():
		return
	else:
		emit_signal("terminado", "alerta")

func mirar_target() -> bool:
	perspectiva.cast_to = owner.target.position - owner.position
	perspectiva.force_raycast_update()
	observado = perspectiva.get_collider()
	if observado.name == "Jugador":
		es_jugador = true
	
	return es_jugador