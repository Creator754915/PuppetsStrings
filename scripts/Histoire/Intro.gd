extends CanvasLayer

onready var dialogue_box = $DialogueBox

func _ready():
	if !dialogue_box.running:
		dialogue_box.start()


func _on_DialogueBox_dialogue_signal(value):
	if value == "end_intro":
		SceneTransition.change_scene_intro("res://levels/level1.tscn")
