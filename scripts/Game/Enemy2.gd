extends KinematicBody2D

const speed = 200
const gravity = 20
var motion = Vector2()


var direction = 1


func _physics_process(delta):
	motion.y += gravity
	motion.x += speed * direction
	if is_on_wall():
		direction = direction * -1

		
	motion = move_and_slide(motion)

func _process(delta):
	var hook = get_node("../Node2D")
	var player_position = global_transform.origin
	var hook_position = hook.global_transform.origin
	var d = player_position.distance_to(hook_position)

	yield(get_tree().create_timer(2), "timeout")
	if d > 310:
		motion.x += (speed * 3 ) * direction
	
