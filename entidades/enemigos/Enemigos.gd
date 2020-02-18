class_name Enemigos
extends Node2D

onready var enemigo = preload("res://entidades/enemigos/creep/Creep.tscn")
var enemigos = []
var modos = []
var index: int = 0;

func _process(delta: float) -> void:
	instancia_enemigo()

func _enemigo_spawn(entidad) -> void:
	if enemigos.size():
		index = enemigos.find(0)
		if index >= 0:
			enemigos[index] = entidad
		else:
			enemigos.append(entidad)
	else:
		enemigos.append(entidad)

	var modo: int = Mira.modo_aleatorio()
	while modos.has(modo):
		modo = Mira.modo_aleatorio()
	
	entidad.get_node("Mira").set_modo(modo)
	modos.append(modo)
	print(modos)

func _enemigo_saliendo(entidad) -> void:
	modos.remove(entidad.get_node("Mira").get_modo())
	var index: int = enemigos.find(entidad)
	enemigos[index] = 0

#borrar
func instancia_enemigo():
	if enemigos.size() < 8:
		if Input.is_action_just_pressed("clic_derecho"):
			self.add_child(enemigo.instance())
