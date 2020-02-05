class_name Enemigo
extends KinematicBody2D

signal spawneado(entidad)

var modo: int setget set_modo

func _ready() -> void:
	get_parent().connect("spawneado", self, "_enemigo_spawn")
	emit_signal("spawneado", self)

func set_modo(nuevo_modo: int):
	modo = nuevo_modo
