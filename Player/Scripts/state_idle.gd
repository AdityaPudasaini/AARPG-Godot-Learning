class_name State_Idle extends State

@onready var walk: State = $"../Walk"


## What happens when player enters this state
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass


## What happens when player exits this state
func Exit() -> void:
	pass


## WHat happens during the _process update in this state
func Process( _delta : float ) -> State:
	
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null


## What happens during the _physics update in this state
func Physics( _deltea : float ) -> State:
	return null


## What happens with input event in this state
func HandleInput( _event : InputEvent ) -> State:
	return null
