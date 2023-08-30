extends Control

onready var dialogue_box = $CanvasLayer/DialogueBox

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !dialogue_box.running:
		dialogue_box.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
