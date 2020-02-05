extends Estado

var rapidez: int
var dashdir: Vector2
onready var multiplicador: int = 3

func entrar():
	if $TimerCD.is_stopped():
		rapidez = JugadorStats.get_rapidez()
		dashdir = owner.movedir
		$TimerDash.start()
		$TimerCD.start()
	else:
		emit_signal("terminado", "quieto")

func actualizar():
	dash()

func dash() -> void:
	var velocidad_dash: Vector2 = dashdir.normalized()*multiplicador*rapidez
	owner.move_and_slide(velocidad_dash)
	
func _on_TimerDash_timeout() -> void:
	emit_signal("terminado", "quieto")
