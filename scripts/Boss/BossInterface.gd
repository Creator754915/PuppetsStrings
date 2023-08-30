extends TextureButton



func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/Boss.tscn")


func _on_TextureButton2_pressed():
	pass


func _on_TextureButton3_pressed():
	get_tree().quit()
