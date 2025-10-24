class_name PlayerState extends State

#los porcentajes son de que tan completo estan cada estado
#mientras mas perfecto quede o mientras mas se le agregue
#toca aun mas aumentar el numero, pero obviamente nunca va a llegar al 100% hasta que todo el contenido agregable sea agregado
#y luego pulido(que esto es mas lo ultimo XD)
const IDLE = "Idle" #75%
const CROUCHING = "Crouching" #0%
const WALKING = "Walking" #0%
const RUNNING = "Running" #75%
const JUMPING = "Jumping" #80%
const DIAGONALJUMP = "DiagonalJump" #80%
const FALLING = "Falling" #80%
const ATTACK = "Attack" #80% falta poner mas anim y mas ataques, pero eso se hace cuando este listo los modelos, ya hice al menos 2 ataque
const AIRATTACK = "AirAttack" #0%
const LOWATTACK = "LowAttack" #0%


var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
