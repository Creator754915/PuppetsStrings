extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if get_tree().current_scene.get_name() == "BossScene":
		zoom.x = 1.5
		zoom.y = 1.5
