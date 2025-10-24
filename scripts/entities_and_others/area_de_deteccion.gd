#dani, o sebas, quien sea que este leyendo esto
#la idea era hacer un enemigo de prueba, obviamente no me salio
#y ni recive el daño que deberia de recivir, probe con un par de tutoriales, en general ninguno me sirvio :(


extends CharacterBody3D
@export var vida = 20


func damaged(ultimo_ataque):
	vida -= ultimo_ataque

func _on_body_entered(body: Node3D) -> void:
	
	print("OBJETO_DETECTADO")


func _on_area_entered(area: Area3D) -> void:
	damaged(true)
	print("la vida restante es ", vida)
	if vida == 0:
		queue_free() #esto es para quitar al enemigo de la escena

	print("AREA_DETECTADA")
