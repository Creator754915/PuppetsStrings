extends Sprite

var key_touch : bool = false

func _ready():
	self.visible = true


func _process(delta):
	if key_touch == true:
		key_touch = true
		position = Vector2(5000, 5000)
		print(key_touch)


		
func _on_Area2D_body_entered(body):
	print("Entered: ", body.name)
	if body.name == "Player":
		key_touch = true
