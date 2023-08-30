extends KinematicBody2D

#onready var path_follow = get_parent()
#export var _speed = 2

onready var lazer = $Lazer
onready var head = $Head

var tete = preload("res://textures/boss/tete.png")
var tete2 = preload("res://textures/boss/tete2.png")
var tete3 = preload("res://textures/boss/tete3.png")

var animation_number = round(rand_range(1, 3))

func _ready():
	lazer.visible = true
	head.texture = tete
	head.scale = Vector2(1, 1)
	

func _process(delta):
	if animation_number == 1:
		$AnimationPlayer.stop()
		for i in range(5):
			start_iddle()
			yield(get_tree().create_timer(2), "timeout")
			
		$AnimationPlayer.stop()
		animation_number = round(rand_range(1, 4))
	
	elif animation_number == 2:
		$AnimationPlayer.stop()
		for i in range(5):
			start_zigzag()
			yield(get_tree().create_timer(2), "timeout")
		
		$AnimationPlayer.stop()
		animation_number = round(rand_range(1, 4))
	
	elif animation_number == 3:
		$AnimationPlayer.stop()
		for i in range(4):
			lazer.rotate_nmb = 4
			start_train()
			yield(get_tree().create_timer(4), "timeout")
		
		$AnimationPlayer.stop()
		lazer.rotate_nmb = 2
		animation_number = round(rand_range(1, 4))
	
	
	#if BossLife.life <= 0:
		#$AnimationPlayer.stop()
		#$AnimationPlayer.play("die")
		
	if head.texture == tete3:
		$AnimationPlayer.play("die")
	
	print(head.texture)
	
func start_iddle():
	$AnimationPlayer.play("iddle")
	
func start_zigzag():
	$AnimationPlayer.play("zigzag")

func start_train():
	$AnimationPlayer.play("train")


func _on_Area2D_body_entered(body):
	if body.name == "Sword":
		if head.texture == tete:
			head.texture = tete2
			head.scale = Vector2(2.125, 2)
		elif head.texture == tete2:
			head.texture = tete3
			head.scale = Vector2(2.125, 2)
		elif head.texture == tete3:
			$AnimationPlayer.play("die")
		
	if body.name == "Sword":
		#BossLife.life -= 10
		$AnimationPlayer.stop()
		$AnimationPlayer.play("die")
		print("TOUCH!!!")
		
