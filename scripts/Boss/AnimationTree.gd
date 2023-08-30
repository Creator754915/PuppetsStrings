extends AnimationTree

var playback : AnimationNodeStateMachinePlayback

func _ready():
	playback = get("parameters/playback")
	playback.start("zigzag")
	active = true


func _process(delta):
	playback.travel("train")
	playback.travel("zigzag")
