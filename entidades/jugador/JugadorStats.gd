extends Node

var vida: int setget set_vida,get_vida
var rapidez: int setget set_rapidez,get_rapidez
var danio_base: int setget set_danio_base,get_danio_base

func set_vida(nueva_vida: int) -> void:
	vida = nueva_vida
func get_vida() -> int:
	return vida
func set_rapidez(nueva_rapidez: int) -> void:
	rapidez = nueva_rapidez
func get_rapidez() -> int:
	return rapidez
func set_danio_base(nuevo_danio: int) -> void:
	danio_base = nuevo_danio
func get_danio_base() -> int:
	return danio_base

func _ready():
	pass
