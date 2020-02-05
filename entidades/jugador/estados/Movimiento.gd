extends Estado

var rapidez: int

func actualizar() -> void:
	if not owner.movedir:
		emit_signal("terminado", "quieto")
	input_dash()
	movimiento_process()

func input_dash():
	if Input.is_action_just_pressed("dash"):
		emit_signal("terminado", "dasheando")

func movimiento_process() -> void:
	var velocidad: Vector2 = owner.movedir.normalized() * rapidez
	owner.move_and_slide(velocidad, Vector2(0,0))

func entrar() -> void:
	rapidez = JugadorStats.get_rapidez()
