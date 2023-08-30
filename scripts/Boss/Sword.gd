extends KinematicBody2D

var random_x = RandomNumberGenerator.new()
var rng_pos = random_x.randf_range(-352, 2062)

var pick : bool = false


func _ready():
	self.position.y = 500

func _process(delta):
	if pick == true:
		if position.x < 840:
			position.x += 1.4
		else:
			position.x -= 1.4
	# self.global_position = get_global_mouse_position()
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and pick == true:
		for n in 40:
			position.y -= 2.5
			yield(get_tree().create_timer(0.15), "timeout")

	
	if position.y < -290:
		pick = false
		position = Vector2(rand_range(-240, 2660), 500)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		pick = true
	
	if body.name == "Boss":
		BossLife.damage(10)
		position = Vector2(rand_range(-240, 2660), 500)
		print("-10 HP")
		pick = false


	print(body.name)
