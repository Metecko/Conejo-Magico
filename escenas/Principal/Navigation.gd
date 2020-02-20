extends Navigation2D

var jugador_position: Vector2
var enemigos: Array

func _ready():
	pass

func _process(delta) -> void:
	enemigos = $Enemigos.get_children()
	path_para_enemigos_agresivos()

func _physics_process(delta) -> void:
	jugador_position = $Jugador.position

func path_para_enemigos_agresivos():
	for enemigo in enemigos:
		var estado_controlador = enemigo.get_node("EstadoControlador")
		if estado_controlador.get_estado_actual().name == "Agresivo":
			var nuevo_path = get_simple_path(enemigo.position, jugador_position)
			nuevo_path.remove(0)
			enemigo.set_path(nuevo_path)
			
