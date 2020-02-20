class_name Enemigo
extends KinematicBody2D

signal spawneado(entidad)
signal saliendo_escena(entidad)

var path: PoolVector2Array = [] setget set_path

func set_path(nuevo_path: PoolVector2Array) -> void:
	path = nuevo_path

func _ready() -> void:
	connect("spawneado", get_parent(), "_enemigo_spawn")
	connect("saliendo_escena", get_parent(), "_enemigo_saliendo")
	emit_signal("spawneado", self)
	
func _exit_tree() -> void:
	emit_signal("saliendo_escena", self)
