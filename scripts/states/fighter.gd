'''
#####################################################
#################### REVISADO #######################
#####################################################
'''

#Script que sirve para globalizar los atributos del peleador

#Clase "Player" hereda atributos del nodo CharacterBody3D
class_name Player extends CharacterBody3D

'''
#####################################################
############# Variables exportadas ##################
#####################################################
'''

@onready var state_machine : StateMachine = $"State_machine"
@export var animation : AnimationPlayer


@export var speed := 8 #Velocidad de desplazamiento
@export var gravity := -15 #Velocidad de caida
@export var jump_impulse := -10 #Velocidad de salto
@export var jump_impulse_light := -5 #Velocidad de movilidad
@export var jump_impulse_diagonal_x := -1  # impulso horizontal del salto diagonal

'''
######### Atributos del personaje #######
'''
@export var damage_A = 10
@export var damage_B = 100
var ultimo_ataque

'''
######### Atributos de prueba (no funcionales) #######
'''
@export var Tiempo := 0.0
@export	var Tiempo_Max := 1.0
@export var Tiempo_Min := 0.5






"""
#######################################
########## LEER CON ATENCIÓN ##########
#######################################

var gravedad = 10
var velocidad_en_X = 10
var velocidad_en_y = 15

func _physics_process(delta):
	# se crea la movilidad/deteccion de teclas para movilidad
	#por si sola podrias moverte libremente por un entorno 3D
	#por eso se crea luego la gravedad, para no permitir cosas como volar
	var direccion = Vector2()
	# basicamente con el "input.get_axis()" nos permite:
	# "input" sirve para detectar 1 tecla o mas segun sea que se quiera especificar la tecla o no
	# "get_axis()" sirve para meterles 2 valores que gracias al "input." podemos indicar cuales queremos que sean
	# detectados al momento de precionarlos, y ademas, hace que dentro del parentesis, los input que escribamos, el primero sea negativa y el otro positivo
	# osea mismo valor de movilidad pero cambia el signo segun lo que toquemos
	direccion.x = Input.get_axis(&"left", &"right")
	direccion.y = Input.get_axis(&"down", &"up")
	
	# se le asigna gravedad al personaje
	position.y -= delta * gravedad
	# el position es un tipo de variable que viene con el character body
	# no me acuerdo para que era delta XD
	# el position es un tipo de variable que seriea un vector3(), osea que tiene 3 espcaios
	# osea las posiciones de "X Y Z" de un objeto dentro de un entorno 3D
	# basicamente en el scrip seria que nuestro objeto/personaje del jugador, su posicion sea movida hacia abajo constaantemente
	# espacificamente su posicion en Y, lo que simula la gravedad
	# valga la redundancia, nosotros utilizamos un vector2, no un vector3
	# porque no necesitamos movimiento 3D, sino uno mas de los juegos de pelea 2D
	# por lo cual el vector2 sirve pues es "X Y" nada mas, osea "atras y adelante" y "arriba y abajo" 
	
	velocity.x = direccion.x * velocidad_en_X
	
	# Jumping code. is_on_floor() must come after move_and_slide().
	if is_on_floor() and Input.is_action_pressed(&"up"):
		velocity.y = direccion.y * velocidad_en_y


	move_and_slide()
"""
