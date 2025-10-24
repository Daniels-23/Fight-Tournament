extends PlayerState
#por cada nuevo ataque, sea Attack_A o Attack_B o Attack_C
#se hace una variable del mismo nombre que el ataque nuevo
#que contenga un string haciendo referencia a la animacion que le corresponde dicho ataque
@export var attack_A : String = "Attack_A"
@export var attack_B : String = "Attack_B"

func enter(previous_state_path: String, data := {}) -> void:
	#esto de aca, es por si se quiere hacer un efecto especial con el attackbox
	#osea, por fuera de lo que es una animacion, capaz quieras modficar algo
	var ataque = $"../../Area3D/Attackbox"
	ataque.disabled = false #la ubicacion del attackbox/ataque es en el centro dentro del jugador, el chiste de hacer esto es para que no haya ni 1 solo frame que por accidente se active en un area donde no debe antes de empezar la animacion(recomendaria mantener esto, a menos que haya alguna mejor solucion :3)
	
	#aun asi no termino de entender muy bien que hace esta funcion al 100%
	#osea, en otras partes del codigo, o se usa para "pre cargar fisicas"(o es lo que entendi)
	#o para activar animaciones, pero cuando tenes tantos ataques variados, no tiene sentido hacer 1 scrip y nodo nuevo por cada nuevo ataque, sea ataque normal o especial
	#es mejor hacer esto que hice yo de 1 nodo/script para todos los ataques normales y ya luego hare otro nodo/script para ataques especiales, solamente para que no se haga muy largo
	#osea, entiendo el punto de para que sirve la state machine, pero aun asi en esto recomendaria que simplemente actives la animacion como mas adelante esta puesto
	#osea segun que input detecto valga la redundancia, aun asi dejo ese var y el ataque.disabled = false, no mas para que funcione


func physics_update(delta: float) -> void:
	if Input.is_action_pressed("attack_A"):
		player.animation.play("Attack_A")
		player.ultimo_ataque = player.damage_A
		print("input_A")
		_on_animation_animation_finished("attack_A")
		
	if Input.is_action_pressed("attack_B"):
		player.animation.play("Attack_B")
		player.ultimo_ataque = player.damage_B
		print("input_B")
		_on_animation_animation_finished("attack_B")
		

	player.move_and_slide()


	#if not Input.is_action_just_pressed("attack_A") or not Input.is_action_just_pressed("attack_B"):
	#	print("acabando ataque")
	#	ataque.disabled = true
	#	ataque.visible = false
	#	finished.emit(IDLE)

#respecto a esto, solo hice la coneccion de AnimationPlayer o "Animation" por el nombre del nodo, a Attack
#y no con otros mas, pues no tiene mucho sentido hacerlo con otros cuando el cambio de animacion es tan facil
#ademas, solo tenes 1 salto(osea 1 animacion de salto no mas) y 1 animacion(talvez 2 como mucho) de salto en diagonal
#cuando de ataques, tenes como 4 animaciones de ataques diferentes y eso sin contar ataques en el aire o agachado(porque este codigo es solo para ataques estando parado, luego toca hacer uno para agachado y saltando)
#talvez a futuro toque agregar la conexion al nodo de recibir daño(aun no lo hice XD), pues se me ocurren como 3 tipos de recivir daño(osea 3animaciones posibles)
#igual convengamos que seguramente al final del proyecto se cambie un poco el sistema, asi que no me sorprenderia si se llegase a cambiar esto 
func _on_animation_animation_finished(anim_name: StringName) -> void:
	#basicamente mas arriba nos envian/detecta cual ataque fue el nombre
	var ataque = $"../../Area3D/Attackbox"
# basicamente, solo se activa si el valor que se le asigna a anim_name a la altura de las lineas 20 aprox, es igual que el valor de las variables del inicio del codigo
#obviament esto sirve para desactivar la capacidad de funcionar(literalmente la deteccion, la desactivas), pues a pesar de ser invisible al terminar una animacion(osea que el encendido y apago de la visibilidad esta en la animacion xd), aun asi se mantiene activa si no lo desactivas, por cierto, trate de hacer que se desactive dentro de la animacion y que lo deje desactivado, pero no funciona y se bugea todo, esto capaz sepas como hacerlo vos sebas, igual este se puede decir que es una solucion "temporal", o al menos la unica que se me vino a la mente luego de varias horas de chocar la cabeza contra el teclado
	if anim_name == attack_A or anim_name == attack_B:
		ataque.disabled = true
		finished.emit(IDLE)
		if anim_name ==attack_A:
			print("ataque_A acabado")
		if anim_name == attack_B:
			print("ataque_B acabado")
