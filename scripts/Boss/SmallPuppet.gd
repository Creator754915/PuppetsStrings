extends KinematicBody2D

onready var sprite = $Sprite

const speed = 200
const gravity = 20
var motion = Vector2()
var UP = Vector2(0, -1)

var direction = 1

onready var player = get_parent().get_node("Node2D/Player")

func _ready():
	position = Vector2(-1693, 1614)


func _physics_process(delta):
	motion.y += gravity
	
	if is_on_floor():
		motion.x = speed * (direction * 1)
	
	if is_on_wall():
		direction = direction * -1
		motion.x = direction
		if direction == -1:
			sprite.flip_h = true
		if direction == 1:
			sprite.flip_h = false

		
	motion = move_and_slide(motion, UP)

