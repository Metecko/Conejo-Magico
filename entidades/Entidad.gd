class_name Entidad
extends KinematicBody2D

export(int) var vida setget ,get_vida
export(int) var rapidez setget set_rapidez,get_rapidez
export(int) var danio setget set_danio,get_danio
var movedir:= Vector2(0,0) setget ,get_movedir

func get_vida() -> int:
	return vida
func set_rapidez(nueva_rapidez) -> void:
	rapidez = nueva_rapidez
func get_rapidez() -> int:
	return rapidez
func set_danio(nuevo_danio) -> void:
	danio = nuevo_danio
func get_danio() -> int:
	return danio
func get_movedir() -> Vector2:
	return movedir

func _physics_process(delta):
	pass

func recibir_danio(danio: int) -> void:
	vida -= danio
	
