class_name Mira
extends Sprite

export(int) var omega = 10
export(int) var amplitud = 20
var desfase: float = PI/8
var modo: int setget set_modo

func _physics_process(delta: float) -> void:
	oscilar()

func set_modo(nuevo_modo):
	modo = nuevo_modo
	desfase *= modo

func oscilar():
	position.x = amplitud*sin(Global.tiempo*omega + desfase)
