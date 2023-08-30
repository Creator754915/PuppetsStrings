extends Node2D

var playing_boss : bool = false
var time : float = 0.0

func _ready():
	playing_boss = true
	print(playing_boss)

func _process(delta):
	time += delta
	if time > 5:
		$Boss/AnimationPlayer.play("die")
		yield(get_tree().create_timer(3), "timeout")
		get_tree().change_scene("res://scenes/END.tscn")
