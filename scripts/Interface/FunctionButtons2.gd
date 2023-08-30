extends TextureButton


func _ready():
	pass # Replace with function body.

func _on_TextureButton_pressed():
	if LevelIntro.playing_intro == true:
		SceneTransition.change_scene("res://levels/level2.tscn")
	else:
		SceneTransition.change_scene("res://levels/level2.tscn")

func _on_TextureButton2_pressed():
	get_tree().change_scene(("res://scenes/Option.tscn"))

func _on_TextureButton3_pressed():
	get_tree().quit()
