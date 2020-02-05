extends Node

export(NodePath) var ESTADO_INICIAL

onready var estados_mapa = {
		"quieto": $Quieto,
		"movimiento": $Movimiento,
		"dasheando": $Dasheando,
		"golpeado": $Golpeado,
		"atacando": $Atacando,
	}
	
var estado_actual
var _activo: = false setget set_activo

func set_activo(value):
	_activo = value
	set_physics_process(value)
	set_process_input(value)
	if not _activo:
		estado_actual = null

func _ready() -> void:
	if not ESTADO_INICIAL:
		ESTADO_INICIAL = estados_mapa["quieto"]
	inicializar(ESTADO_INICIAL)

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	estado_actual.actualizar()
	$Label.text = estado_actual.name

func _cambiar_estado(estado: String):
	if not _activo:
		return
	var estado_nuevo = estados_mapa[estado]
	if estado_actual != estado_nuevo:
		estado_actual.salir()
		estado_actual = estado_nuevo
		estado_actual.entrar()
	
func inicializar(estado_inicial) -> void:
	set_activo(true)
	estado_actual = get_node(estado_inicial)
	estado_actual.entrar()
