class_name State extends Node

static var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


## What happens when player enters this state
func Enter() -> void:
	pass

## What happens when player exits this state
func Exit() -> void:
	pass

## WHat happens during the _process update in this state
func Process( _delta : float ) -> State:
	return null

## What happens during the _physics update in this state
func Physics( _deltea : float ) -> State:
	return null

## What happens with input event in this state
func HandleInput( _event : InputEvent ) -> State:
	return null
