extends TextureButton


func _on_TextureButton3_pressed():
	print(get_tree().get_current_scene().name)
	get_tree().change_scene("res://scenes/Interface.tscn")
