class_name EnemyStateDestroy extends EnemyState

@export var anim_name : String = "destroy"
@export var knockback_speed : float = 200.0
@export var decelerate_speed : float = 10.0

@export_category("AI")

var _direction : Vector2

## What happens when we initialize this state
func init() -> void:
	enemy.enemy_destroyed.connect( _on_enemy_destroyed )
	pass
	
	
## What happens when player enters this state
func enter() -> void:
	enemy.invunerable = true
	
	_direction = enemy.global_position.direction_to( enemy.player.global_position )
	enemy.set_direction( _direction )
	enemy.velocity = _direction * -knockback_speed	
	enemy.update_animation( anim_name )
	enemy.animation_player.animation_finished.connect( _on_animation_finished )
	pass


## What happens when player exits this state
func exit() -> void:
	pass


## WHat happens during the _process update in this state
func process( _delta : float ) -> EnemyState:
	
	enemy.velocity = enemy.velocity * decelerate_speed * _delta
	return null


## What happens during the _physics update in this state
func physics( _deltea : float ) -> EnemyState:
	return null


func _on_enemy_destroyed() -> void:
	state_machine.change_state( self )
	pass


func _on_animation_finished( _a : String ) -> void:
	enemy.queue_free()
