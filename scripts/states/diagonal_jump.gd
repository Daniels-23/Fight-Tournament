extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = -player.jump_impulse * 1.2
	player.velocity.x = -player.jump_impulse_diagonal_x
#	player.animation_player.play("jump")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta + 2
	player.move_and_slide()

	if Input.is_action_just_pressed("attack_A") and not player.is_on_floor() or Input.is_action_just_pressed("attack_B") and not player.is_on_floor():
		print("Ataque_detectado_1")
		finished.emit(AIRATTACK)
	elif player.velocity.y >= 0:
		finished.emit(FALLING)
