extends CanvasLayer

export(Texture) var blank = null

func _ready():
	Input.set_custom_mouse_cursor(blank, Input.CURSOR_ARROW)
	
func _process(delta):
	$Sprite.global_position = $Sprite.get_global_mouse_position()
