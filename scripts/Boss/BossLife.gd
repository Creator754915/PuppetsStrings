extends ProgressBar

var life : int = 100

func _ready():
	value = life


func damage(x) -> void:
	value -= x
	
func _process(delta):
	if value == 0:
		queue_free()
