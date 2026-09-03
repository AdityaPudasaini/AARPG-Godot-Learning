class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"


## What happens when player enters this state
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

## What happens when player exits this state
func Exit() -> void:
	pass

## WHat happens during the _process update in this state
func Process( _delta : float ) -> State:
	
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
		
	return null

## What happens during the _physics update in this state
func Physics( _deltea : float ) -> State:
	return null

## What happens with input event in this state
func HandleInput( _event : InputEvent ) -> State:
	
	if _event.is_action_pressed("attack"):
		return attack
		
	return null
