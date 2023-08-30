extends Control


func _ready():
	yield(get_tree().create_timer(10), "timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
