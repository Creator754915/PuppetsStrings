extends TextureButton


func _on_TextureButton1_pressed():
	get_tree().change_scene("res://scenes/BossInterface.tscn")

func _on_TextureButton3_pressed():
	get_tree().quit()
