class_name AgresivoCreep
extends Estado

export(int) var multi_rapidez
onready var perspectiva: RayCast2D = owner.get_node("RayCastVision")
var observado
var es_jugador = false
var position_tramo
var distancia_tramo

func entrar() -> void:
	$ReaccionTimer.wait_time = owner.get_tiempo_reaccion()
	$ReaccionTimer.start()

func actualizar():
	if mirar_target():
		if owner.is_puede_moverse():
			perseguir_target()
	else:
		emit_signal("terminado", "alerta")

func mirar_target() -> bool:
	perspectiva.cast_to = owner.target.position - owner.position
	perspectiva.force_raycast_update()
	observado = perspectiva.get_collider()
	if observado.name == "Jugador":
		es_jugador = true
		owner.set_ultima_target_pos(observado.position)
	else:
		es_jugador = false
	
	return es_jugador

func perseguir_target() -> void:
	position_tramo = owner.path[0]
	distancia_tramo = owner.position.distance_to(position_tramo)
	owner.movedir = (position_tramo -owner.position).normalized()
	if distancia_tramo > 0.5:
		var timer_atrapado = get_parent().get_node("AtrapadoTimer")
			
		if timer_atrapado.is_stopped():
			owner.move_and_slide(owner.movedir*owner.get_rapidez())
		else:
			var normal: Vector2 = (owner.position - owner.get_objeto_colisionado().position).normalized()
			owner.move_and_slide((owner.movedir + normal.rotated(randi() % 3 - 1))*owner.get_rapidez()*multi_rapidez)
	else:
		owner.path.remove(0)


func _on_ReaccionTimer_timeout() -> void:
	owner.set_puede_moverse(true)
