extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:

#	player.animation_player.play("fall")
	print("falling")
	pass
	
func physics_update(delta: float) -> void:
	#esto del var, parece que no sirve de nada realmente, pues ya las fisicas del movimiento en X ya estan integradas al moverse saltar y luego caer en movimiento
	#para lo que en verdad sirve es para lo del if al final
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.y += player.gravity * delta * 2
	player.move_and_slide()

#	if Input.is_action_just_released("up") and Input.is_action_just_released("left") or Input.is_action_just_released("up") and Input.is_action_just_released("right"):
#		var input_direction_x := Input.get_axis("left", "right")
#		player.velocity.y += player.gravity * delta
#		print("caida diagonal")
#		player.move_and_slide()

		

#esto es para que cuando el jugador este cayendo
#si tras caer el jugador tiene sostenido la tecla de movimiento(derecha o izquierda)
#entonces lo pasa al estado de correr directamente
#en vez de ponerlo en idle
#yo creo que esto esta muy bien y que probablemente no habria que tocarlo
	if player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)
	elif Input.is_action_just_pressed("attack_A") or Input.is_action_just_pressed("attack_B"):
		print("AirAtaque_detectado_3")
		finished.emit(AIRATTACK)
