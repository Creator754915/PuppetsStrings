extends KinematicBody2D

const speed = 400
const gravity = 0
const UP = Vector2(0, -1)

var motion = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0


	motion = move_and_slide(motion)

