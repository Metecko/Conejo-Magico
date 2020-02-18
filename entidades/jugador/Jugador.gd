class_name Jugador
extends KinematicBody2D

signal atacando(tipo)

export(int) var vida_inicial
export(int) var rapidez_inicial
export(int) var danio_base_inicial
export(float) var precision_inicial
var movedir:= Vector2(0,0) setget ,get_movedir

func _ready():
	inicializar()
	
func get_movedir() -> Vector2:
	return movedir

# warning-ignore:unused_argument
func _process(delta) -> void:
	input_movimiento()

func _input(event: InputEvent) -> void:
	input_ataque(event)

func input_movimiento() -> void:
	var left := Input.is_action_pressed("ui_left")
	var right := Input.is_action_pressed("ui_right")
	var up := Input.is_action_pressed("ui_up")
	var down := Input.is_action_pressed("ui_down")
	
	movedir.x = int(right) - int(left)
	movedir.y = int(down) - int(up)

func input_ataque(event: InputEvent) -> void:
	if event.is_action_pressed("disparar_rayo"):
		$EstadoControlador._cambiar_estado("atacando")
		emit_signal("atacando", "disparar_rayo")
	if event.is_action_pressed("bastonazo"):
		$EstadoControlador._cambiar_estado("atacando")
		emit_signal("atacando", "bastonazo")

func inicializar() -> void:
	JugadorStats.set_rapidez(rapidez_inicial) 
	JugadorStats.set_vida(vida_inicial)
	JugadorStats.set_danio_base(danio_base_inicial)
	JugadorStats.set_precision(precision_inicial)
