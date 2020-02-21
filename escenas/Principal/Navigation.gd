extends Navigation2D

const CONTROL_PATH: PackedScene = preload("res://escenas/ControlPuntosPath.tscn")
var jugador_position: Vector2
var enemigos: Array

func _ready():
	pass

func _process(delta) -> void:
	enemigos = $Enemigos.get_children()
	path_para_enemigos_agresivos()
	path_para_enemigos_pasivos()
	
func _physics_process(delta) -> void:
	jugador_position = $Jugador.position

func path_para_enemigos_agresivos():
	for enemigo in enemigos:
		var estado_controlador = enemigo.get_node("EstadoControlador")
		if estado_controlador.get_estado_actual().name == "Agresivo":
			var nuevo_path = get_simple_path(enemigo.position, jugador_position)
			nuevo_path.remove(0)
			for punto in nuevo_path:
				var radio_enemigo = enemigo.get_node("CollisionShape2D").shape.radius
				var control = CONTROL_PATH.instance(radio_enemigo)
				control.position = punto
				add_child(control)
			enemigo.set_path(nuevo_path)

func path_para_enemigos_pasivos():
	for enemigo in enemigos:
		var estado_controlador = enemigo.get_node("EstadoControlador")
		if estado_controlador.get_estado_actual().name == "Pasivo":
			var nuevo_path = get_simple_path(enemigo.position, enemigo.get_position_inicial())
			nuevo_path.remove(0)
			enemigo.set_path(nuevo_path)
