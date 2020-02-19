class_name Creep
extends Enemigo

export(int) var radio_deteccion
export(float) var tiempo_reaccion
var movedir:= Vector2(0,0) setget ,get_movedir
var target
var puede_moverse = false

func get_movedir() -> Vector2:
	return movedir

func _ready() -> void:
	$Visibilidad/CollisionShape2D.shape.radius = radio_deteccion
	$ReaccionTimer.wait_time = tiempo_reaccion
	position = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	pass

func actualizar() -> void:
	if target:
		pass 

func _on_Vision_body_entered(body: Node) -> void:
	target = body

func _on_ReaccionTimer_timeout() -> void:
	puede_moverse = true

func _on_Vision_body_exited(body: Node) -> void:
	if body == target:
		target = null
		$ReaccionTimer.time_left = tiempo_reaccion
