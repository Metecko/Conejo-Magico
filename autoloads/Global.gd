extends Node

onready var tiempo: float = 0 setget ,get_tiempo

func get_tiempo() -> float:
	return tiempo

func _physics_process(delta: float) -> void:
	tiempo += delta
