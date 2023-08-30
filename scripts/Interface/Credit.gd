extends Control


func _ready():
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://scenes/Interface.tscn")

