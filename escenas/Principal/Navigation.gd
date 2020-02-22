extends Navigation2D

const CONTROL_PATH: PackedScene = preload("res://escenas/ControlPuntosPath.tscn")
var controles = []
var jugador_position: Vector2
var enemigos: Array

func _ready():
	pass

func _process(delta) -> void:
	enemigos = $Enemigos.get_children()
	
	path_para_enemigos_pasivos()
	
func _physics_process(delta) -> void:
	jugador_position = $Jugador.position
	print(controles.size())
	path_para_enemigos_agresivos()
	
func path_para_enemigos_agresivos():
	for enemigo in enemigos:
		var estado_controlador = enemigo.get_node("EstadoControlador")
		if estado_controlador.get_estado_actual().name == "Agresivo":
			var nuevo_path = get_simple_path(enemigo.position, jugador_position)
			nuevo_path.remove(0)
			for control_funcion in controles:
				control_funcion[1].resume()
				controles.erase(control_funcion)
			for i in range(nuevo_path.size() - 1):
				var radio_enemigo = enemigo.get_node("CollisionShape2D").shape.radius
				var control = CONTROL_PATH.instance()
				add_child(control)
				control.set_radio_enemigo(radio_enemigo)
				var punto = nuevo_path[i]
				control.position = punto
				controles.append([control, control.print_colisiones()])
			
			enemigo.set_path(nuevo_path)

func path_para_enemigos_pasivos():
	for enemigo in enemigos:
		var estado_controlador = enemigo.get_node("EstadoControlador")
		if estado_controlador.get_estado_actual().name == "Pasivo":
			var nuevo_path = get_simple_path(enemigo.position, enemigo.get_position_inicial())
			nuevo_path.remove(0)
			enemigo.set_path(nuevo_path)
