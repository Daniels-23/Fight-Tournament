class_name FighterIdleState
extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.animation.play("Idle")

func physics_update(_delta: float) -> void:
	
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()

	if not player.is_on_floor():
		print("cayendo_0")
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("up") and Input.is_action_pressed("left") or Input.is_action_just_pressed("up") and Input.is_action_pressed("right"):
		print("salto_diagonal_detectado_0")
		finished.emit(DIAGONALJUMP)
	elif Input.is_action_just_pressed("up"):
		print("salto_detectado_0")
		finished.emit(JUMPING)
	elif Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		print("Correr_detectado_0")
		finished.emit(RUNNING)
	elif Input.is_action_just_pressed("attack_A") or Input.is_action_just_pressed("attack_B"):
		print("Ataque_detectado_0")
		finished.emit(ATTACK)
