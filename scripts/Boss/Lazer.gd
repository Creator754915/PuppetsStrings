extends KinematicBody2D

var rnd = RandomNumberGenerator.new()
var rnd_time = rnd.randf_range(10, 60)

var rotate = rotation_degrees
var rotate_nmb = 0.5

#func _ready():
	#rotation_degrees = 63


func _process(delta):
	rotation_degrees -= rotate_nmb
	#yield(get_tree().create_timer(1), "timeout")
