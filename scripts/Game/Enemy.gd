extends KinematicBody2D

onready var animSprite = $AnimatedSprite

const speed = 200
const gravity = 20
var motion = Vector2()
var UP = Vector2(0, -1)

var direction = 1


func _physics_process(delta):
	motion.y += gravity
	
	if is_on_floor():
		motion.x = speed * direction
		
	if is_on_wall():
		direction = direction * -1
		motion.x = direction
		if direction == -1:
			animSprite.flip_h = false
		if direction == 1:
			animSprite.flip_h = true
		
	motion = move_and_slide(motion, UP)

