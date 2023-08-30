extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite
onready var vie = $Camera2D/TextureRect
onready var textureProgressBar = $Camera2D/TextureProgress


class_name Player


const speed = 400
const gravity = 20
const UP = Vector2(0, -1)
var hearts = 5

var jump_count = 0
export var extrajumps = 1
const jump = -500
var dash_count = 0

var wallslide_speed = 100
var wall_slide_gravity = 100
var is_wall_sliding : bool = false

var motion = Vector2()

var axisX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")


func _physics_process(delta):
	motion.y += gravity
	
	axisX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if axisX > 0:
		animatedSprite.animation = "run"
		animatedSprite.flip_h = false
	elif axisX < 0:
		animatedSprite.animation = "run"
		animatedSprite.flip_h = true
	else:
		animatedSprite.animation = "iddle"
	
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
		
		
	if Input.is_key_pressed(KEY_T) and  Input.is_key_pressed(KEY_V) and  Input.is_key_pressed(KEY_A):
		position = Vector2(-4819, -1535)
		yield(get_tree().create_timer(10), "timeout")
		position = Vector2(704, 265)
		
	
	if Input.is_action_pressed("ui_right") && Input.is_action_just_pressed("ui_down") && dash_count == 0:
		motion.x = speed * 70
		dash_count += 1
	
	if Input.is_action_pressed("ui_left") && Input.is_action_just_pressed("ui_down") && dash_count == 0:
		motion.x = -speed * 70
		dash_count += 1
		
	if is_on_wall() and !is_on_floor():
		if (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")) or abs(Input.get_joy_axis(0, 0)) > 0.3:
			is_wall_sliding = true
		else:
			is_wall_sliding = false
	else:
		is_wall_sliding = false
		
	if is_wall_sliding == true:
		motion.y += (wall_slide_gravity * delta)
		motion.y = min(motion.y, wallslide_speed)
		
	
	if Input.is_action_just_pressed("ui_up") && jump_count < extrajumps:
		if !is_on_wall():
			motion.y = jump
			jump_count += 1
	
	if Input.is_action_just_pressed("ui_up"):
		if is_on_wall() && Input.is_action_pressed("ui_right"):
			motion.y = jump
			motion.x = -speed
		elif is_on_wall() && Input.is_action_pressed("ui_left"):
			motion.y = jump
			motion.x = speed
		
			
	if is_on_floor():
		jump_count = 0
		dash_count = 0
		
	
	# position = Vector2(704, 131)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		
		if collision.collider.name == "SmallPuppet" or collision.collider.name == "Enemy" or collision.collider.name == "Enemy2":
			hit()
			motion.y = -800
			motion.x = 1000 * -1
			hearts -= 1
			textureProgressBar.value -= 20
			print(collision.collider.name)
			
		elif collision.collider.name == "Spike" or collision.collider.name == "Spike2":
			hit()
			position = Vector2(704, 265)
			hearts -= 1
			textureProgressBar.value -= 20
			print(collision.collider.name)
		
		elif collision.collider.name == "Boss":
			motion = Vector2(motion.x * 1.4, motion.y)
			hit()
			hearts -= 1
			textureProgressBar.value -= 20
		
		elif collision.collider.name == "Bullet":
			hit()
			hearts -= 1
			textureProgressBar.value -= 20
		
		elif collision.collider.name == "Lazer":
			hit()
			sound_hit()
			motion = Vector2(motion.x + 1300, motion.y)
			hearts -= 1
			textureProgressBar.value -= 10
		
		elif collision.collider.name == "Bupper":
			position = Vector2(position.x, position.y - 900)
		
		elif collision.collider.name == "Detect":
			SceneTransition.change_scene("res://levels/level2.tscn")
		
		elif collision.collider.name == "End":
			SceneTransition.change_scene("res://levels/level3.tscn")
		
		elif collision.collider.name == "End2":
			SceneTransition.change_scene("res://levels/level4.tscn")
			
		elif collision.collider.name == "End3":
			SceneTransition.change_scene("res://levels/level5.tscn")
		
		elif collision.collider.name == "End4":
			SceneTransition.change_scene("res://scenes/Boss.tscn")
				

		
		if textureProgressBar.value == 0:
			var vie3 = preload( "res://textures/perso/vie/vie3.png")
			var vie2 = preload( "res://textures/perso/vie/vie2.png")
			var vie1 = preload( "res://textures/perso/vie/vie1.png")
			var vie0 = preload( "res://textures/perso/vie/vie0.png")
		
			
			if vie.texture == vie3:
				vie.texture = vie2
				textureProgressBar.value = 100
			elif vie.texture == vie2:
				vie.texture = vie1
				textureProgressBar.value = 100
			elif vie.texture == vie1:
				vie.texture = vie0
				textureProgressBar.value = 100
			elif textureProgressBar.value <= 100 and get_tree().current_scene.get_name() == "BossScene":
				get_tree().change_scene("res://scenes/BossGameOver.tscn")
				queue_free()
			else:
				get_tree().change_scene("res://scenes/GameOver.tscn")
				queue_free()
		
			
	if hearts == 0:
		var vie3 = preload( "res://textures/perso/vie/vie3.png")
		var vie2 = preload( "res://textures/perso/vie/vie2.png")
		var vie1 = preload( "res://textures/perso/vie/vie1.png")
		var vie0 = preload( "res://textures/perso/vie/vie0.png")
			
		if vie.texture == vie3:
			vie.texture = vie2
			hearts = 5
		elif vie.texture == vie2:
			vie.texture = vie1
			hearts = 5
		elif vie.texture == vie1:
			vie.texture = vie0
			hearts = 5
		elif vie.texture == vie0 and hearts == 0 and get_tree().current_scene.get_name() == "BossScene":
				get_tree().change_scene("res://scenes/BossGameOver.tscn")
				queue_free()
		else:
			get_tree().change_scene("res://scenes/GameOver.tscn")
			queue_free()
		
		
	motion = move_and_slide(motion, UP)
	
	
var is_hit = false
func hit()->void:
	if is_hit:return
	is_hit = true
	$AnimatedSprite.modulate = Color.red
	yield(get_tree().create_timer(0.3), "timeout")
	$AnimatedSprite.modulate = Color.white
	is_hit = false

func sound_hit() -> void:
	$AudioStreamPlayer2D.play()
	yield(get_tree().create_timer(1), "timeout")
	$AudioStreamPlayer2D.stop()

	
func _process(delta):
	if position.y > 1100:
		position = Vector2(704, 131)
		hearts -= 1
		textureProgressBar.value -= 40
	
	if KeyVariables.key_touch == true:
		KeyVariables.key_touch = true
		print("Player: ", KeyVariables.key_touch)
	
	if BossLife.value == 0:
		queue_free()
	

func _on_Area2D_body_entered(body):
	if body.name == "Key":
		KeyVariables.key_touch = true
	
	print(KeyVariables.key_touch)
