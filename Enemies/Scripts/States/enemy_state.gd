class_name EnemyState extends Node

var enemy : Enemy
var state_machine : EnemyStateMachine


## What happens when we initialize this state
func init() -> void:
	pass
	
	
## What happens when player enters this state
func enter() -> void:
	pass


## What happens when player exits this state
func exit() -> void:
	pass


## WHat happens during the _process update in this state
func process( _delta : float ) -> EnemyState:
	return null


## What happens during the _physics update in this state
func physics( _deltea : float ) -> EnemyState:
	return null
