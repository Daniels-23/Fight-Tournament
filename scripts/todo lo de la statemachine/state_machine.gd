class_name StateMachine extends Node

@export var initial_state: State = null
@export var debug_label : Label

@onready var state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)).call()


func _ready() -> void:
	for state_node: State in find_children("*", "State"):
		_update_debug_label()
		state_node.finished.connect(_transition_to_next_state)

	await owner.ready
	state.enter("")

func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)




###no tocar, creo que esto esta bien, pues lo unico que hace es cambiar de estado segun indiquen los input
###y como no controla cuales imput, sino que solamente controla la entreda y salida de estado a estado
###practicamente no habria necesidad a futuro(quiero creer) de modificar esto, ni tampoco serviria de mucho creo
func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		printerr(owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist.")
		return
	
	var previous_state_path := state.name
	state.exit()
	state = get_node(target_state_path)
	state.enter(previous_state_path, data)
	_update_debug_label()

func _update_debug_label() -> void:
	if debug_label:
		debug_label.text = "State: "+state.name
