class_name Estado
extends Node

# warning-ignore:unused_signal
signal terminado(nuevo_estado)

func _ready() -> void:
# warning-ignore:return_value_discarded
	connect("terminado", get_parent(), "_cambiar_estado")

func actualizar():
	pass

func entrar():
	pass#print("estado actual: "+get_parent().estado_actual.name)

func salir():
	pass#print("saliendo de: "+get_parent().estado_actual.name)
