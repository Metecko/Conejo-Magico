class_name Mira
extends Sprite

export(int) var omega = 10
export(int) var amplitud = 20
onready var desfase: float = PI/8
var modo: int setget set_modo, get_modo
var punteria: float setget , get_punteria
var theta: float

func _physics_process(delta: float) -> void:
	oscilar()

func set_modo(nuevo_modo) -> void:
	modo = nuevo_modo
	desfase *= modo
	print(modo)

func get_modo() -> int:
	return modo

func oscilar():
	theta = Global.tiempo*omega + desfase
	punteria = sin(theta)
	position.x = amplitud*punteria

static func modo_aleatorio() -> int:
	return randi() % 8 + 1

func get_punteria():
	return punteria
