extends KinematicBody2D

onready var laser = $Lazer

var tp : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	laser.visible = false
	$Particles2D.emitting = false


func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()
	
	
func _process(delta):
	laser.position.y = 640
	laser.visible = false
		
		
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		laser.position.y = 114
		laser.visible = true
		tp = true
		$Particles2D.emitting = true
		$AudioStreamPlayer2D.play()
		position.x = rand_range(-214, 1500)
		$Particles2D.emitting = true
		$AudioStreamPlayer2D.play()
		$Particles2D.emitting = false
