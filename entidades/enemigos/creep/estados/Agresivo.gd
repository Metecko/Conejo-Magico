class_name AgresivoCreep
extends Estado

onready var perspectiva: RayCast2D = owner.get_node("RayCastVision")
var observado
var es_jugador = false
var position_tramo
var distancia_tramo

func actualizar():
	if mirar_target():
		perseguir_target()
	else:
		emit_signal("terminado", "alerta")

func mirar_target() -> bool:
	perspectiva.cast_to = owner.target.position - owner.position
	perspectiva.force_raycast_update()
	observado = perspectiva.get_collider()
	if observado.name == "Jugador":
		es_jugador = true
	else:
		es_jugador = false
	
	return es_jugador

func perseguir_target() -> void:
	position_tramo = owner.path[0]
	distancia_tramo = owner.position.distance_to(position_tramo)
	owner.movedir = ( position_tramo -owner.position).normalized()
	if distancia_tramo > 0.5:
		owner.move_and_slide(owner.movedir*40)
	else:
		owner.path.remove(0)
