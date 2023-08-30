extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0, 0)
	
	yield(get_tree().create_timer(1), "timeout")
	
	position = Vector2(412, 144)
	
	yield(get_tree().create_timer(24), "timeout")
	
	queue_free()


