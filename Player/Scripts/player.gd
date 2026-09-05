class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
const DIR_4 : Array = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP ]

signal DirectionChanged( new_direction : Vector2 )

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	PlayerManager.player = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	# direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = Vector2 (
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	pass


func _physics_process(delta: float) -> void:
	move_and_slide()


func SetDirection() -> bool:
	
	if direction == Vector2.ZERO:
		return false
	
	var direction_id : int = int( round ( ( direction + cardinal_direction * 0.1).angle() / TAU * DIR_4.size() ) )
	var new_dir = DIR_4[ direction_id ]
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	DirectionChanged.emit( new_dir )
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	
	return true


func UpdateAnimation( state : String) -> void:
	animation_player.play( state + "_" + AnimDirection() )
	pass


func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	
	elif cardinal_direction == Vector2.UP:
		return "up"
	
	else:
		return "side"
