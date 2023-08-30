extends TextureButton


func _ready():
	pass 

func _on_TextureButton1_pressed():
	get_tree().change_scene("res://scenes/Interface2.tscn")

func _on_TextureButton3_pressed():
	get_tree().quit()

