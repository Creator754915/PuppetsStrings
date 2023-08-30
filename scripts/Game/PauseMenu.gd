extends Panel

func _ready():
	visible = false


func _input(event):
	if Input.is_key_pressed(KEY_P):
		visible = true
		get_tree().paused = true


func _on_TextureButton_pressed():
	visible = false
	get_tree().paused = false
	
func _on_TextureButton2_pressed():
	SceneTransition.change_scene("res://scenes/Interface2.tscn")

func _on_TextureButton3_pressed():
	get_tree().paused = false
	get_tree().quit()
