extends AnimationPlayer


func _ready():
	play("Cut")


func _process(delta):
	if !is_playing():
		SceneTransition.change_scene("res://scenes/ENDINTERFACE.tscn")
