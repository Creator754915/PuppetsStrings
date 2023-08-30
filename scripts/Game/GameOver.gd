extends Control

onready var audio = $AudioStreamPlayer2D
onready var SOUND_LOAD = preload("res://audio/jumpscare/jumpscare3.mp3")


func _ready():
	$CanvasLayer/Panel.visible = false
	$CanvasLayer/Panel/TextureRect.visible = false
	
	dead()

func dead() -> void:
	$CanvasLayer/Panel.visible = true
	
	$CanvasLayer/Panel/TextureRect.visible = true
	$CanvasLayer/Panel/Audio.play()
	
	yield(get_tree().create_timer(4), "timeout")
	
	$CanvasLayer/Panel/TextureRect.visible = false
	$CanvasLayer/Panel/Audio.stop()

