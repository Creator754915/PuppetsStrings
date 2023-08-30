extends Node2D

onready var player = $Node2D/Player


func _ready():
	player.extrajumps = 2
	player.dash_count = 1

func _process(delta):
	player.dash_count = 1
