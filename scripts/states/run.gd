extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
#	player.animation_player.play("run")
	print("running")
	
func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.x = player.speed * input_direction_x
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_pressed("left") and Input.is_action_just_pressed("up") or Input.is_action_pressed("right") and Input.is_action_just_pressed("up"):
		print("salto diagonal detectado 1")
		finished.emit(DIAGONALJUMP)
	#esta linea abria que hablarla con sebas, no parece que realmente afecte en nada
	#puedo que no tenga sentido, pues medio dificil presionar rapidamente izquierda y salto, si ya estabas presionando izquierda
	#tal vez lo termine borrando
	#elif Input.is_action_just_pressed("up") and Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up") and Input.is_action_just_pressed("right"):
	#	print("salto diagonal detectado 2")
	#	finished.emit(DIAGONALJUMP)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
