extends KinematicBody2D

var rng = RandomNumberGenerator.new()
var rng_pos = rng.randf_range(-650, 980)


const speed = 200
const gravity = 10
var motion = Vector2()
var UP = Vector2(0, -1)

var direction = 1
	

func _physics_process(delta):
	motion.y += gravity
	
	if is_on_floor():
		rng_pos = rng.randf_range(-650, 980)
		position = Vector2(rng_pos, 60)
		print("On floor !")
		
	motion = move_and_slide(motion, UP)

#func _process(delta):
#	position.y += 10
#	self.duplicate()
#	if position.y > 550:
#		var rng_pos = rng.randf_range(-650, 980)
#		position = Vector2(rng_pos, 60)
#	
#	print(position.y)
