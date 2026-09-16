class_name HeartGUI extends Control


@onready var sprite: Sprite2D = $Sprite2D

var value : int = 2 :
	set( _value ):
		value = _value
		update_animation()


func update_animation() -> void:
	sprite.frame = value
