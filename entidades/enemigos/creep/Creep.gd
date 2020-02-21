class_name Creep
extends Enemigo

export(int) var radio_deteccion
export(float) var tiempo_reaccion setget ,get_tiempo_reaccion
export(float) var tiempo_atrapado setget ,get_tiempo_atrapado
onready var position_inicial: Vector2 setget ,get_position_inicial
var movedir:= Vector2(0,0) setget ,get_movedir
var target
var puede_moverse: bool setget set_puede_moverse, is_puede_moverse
var quieto: bool setget set_quieto, is_quieto
var ultima_target_pos: Vector2 setget set_ultima_target_pos, get_ultima_target_pos

func get_tiempo_reaccion() -> float:
	return tiempo_reaccion
func get_tiempo_atrapado() -> float:
	return tiempo_atrapado
func get_position_inicial() -> Vector2:
	return position_inicial
func get_movedir() -> Vector2:
	return movedir
func set_puede_moverse(valor: bool) -> void:
	puede_moverse = valor
func is_puede_moverse() -> bool:
	return puede_moverse
func set_quieto(valor: bool) -> void:
	quieto = valor
func is_quieto() -> bool:
	return quieto
func set_ultima_target_pos(pos: Vector2) -> void:
	ultima_target_pos = pos
func get_ultima_target_pos() -> Vector2:
	return ultima_target_pos

func _ready() -> void:
	$Vision/CollisionShape2D.shape.radius = radio_deteccion
	$EstadoControlador/AtrapadoTimer.wait_time = tiempo_atrapado
	position = get_global_mouse_position()
	position_inicial = position

func _physics_process(delta: float) -> void:
	if is_on_wall():
		objeto_colisionado = get_slide_collision(0)
		$EstadoControlador/AtrapadoTimer.start()
