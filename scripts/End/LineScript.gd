extends Line2D


func _on_Area2D_body_entered(body):
	if body.name == "Ciseau":
		queue_free()
	
	print(body.name)
