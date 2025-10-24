extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	#francamente, no tengo ni pta idea de como funciona el jum_impulse
	#osea, lo borro este calculo de aca, no salta el personaje
	#dejo este calculo, pero pongo en 100 o en -100 y sigue saltando de la misma manera exactamente igual
	#si lo pongo en 0 no salta
	player.velocity.y = -player.jump_impulse * 1.2
#	player.animation_player.play("jump")
	print("jump")
	
func physics_update(delta: float) -> void:
		#elif Input.is_action_just_pressed("up"):
#	if Input.is_action_just_pressed("up") and Input.is_action_just_pressed("left") or ("right"):
#		var input_direction_x := Input.get_axis("left", "right")
#		player.velocity.x = player.speed * input_direction_x
#		player.velocity.y += player.gravity * delta
	player.velocity.y += player.gravity * delta + 2
	player.velocity.x = 0
	player.move_and_slide()

	if player.velocity.y >= 0:
		finished.emit(FALLING)
		print("cayendo detectado 1")
	elif Input.is_action_just_pressed("attack_A") or Input.is_action_just_pressed("attack_B"):
		print("Ataque_detectado_1")
		finished.emit(AIRATTACK)
	player.move_and_slide()
