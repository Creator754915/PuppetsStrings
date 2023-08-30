extends CanvasLayer


func change_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("dissolve")

func change_scene_intro(target: String) -> void:
	$AnimationPlayer.play("fade_bounce")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("fade_bounce")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("fade_bounce")
	
