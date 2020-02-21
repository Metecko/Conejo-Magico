class_name PasivoCreep
extends Estado

export(int) var multi_rapidez
var position_tramo: Vector2
var distancia_tramo

func actualizar():
	if owner.movedir != Vector2(0,0):
		volver_position_inicial()

func _on_Vision_body_entered(body):
	if body.name == "Jugador":
		owner.target = body
		emit_signal("terminado", "alerta")


func _on_Vision_body_exited(body: Node) -> void:
	if body.name == "Jugador":
		owner.target = null
		emit_signal("terminado", "pasivo")

func volver_position_inicial() -> void:
	position_tramo = owner.path[0]
	distancia_tramo = owner.position.distance_to(position_tramo)
	owner.movedir = (position_tramo - owner.position).normalized()
	if distancia_tramo > 0.5:
		var timer_atrapado = get_parent().get_node("AtrapadoTimer")
			
		if timer_atrapado.is_stopped():
			owner.move_and_slide(owner.movedir*owner.get_rapidez()*multi_rapidez)
		else:
			var normal: Vector2 = (owner.position - owner.get_objeto_colisionado().position).normalized()
			owner.move_and_slide((owner.movedir + normal.rotated(randi() % 3 - 1))*owner.get_rapidez()*multi_rapidez)
	else:
		owner.move_and_slide(Vector2(0,0))
		owner.path.remove(0)
