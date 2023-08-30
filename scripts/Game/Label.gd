extends Label


func _ready():
	visible = false
	yield(get_tree().create_timer(1), "timeout")
	visible = true
	yield(get_tree().create_timer(3), "timeout")
	text = 'Nix:\n-Excuse moi tu n est pas du tout\nsensée être la'
	yield(get_tree().create_timer(3), "timeout")
	text = 'Nix:\n- Ah oui j oubliais,\n bonjour, je me présente, Nix, \nje suis habitant du monde des pantins '
	yield(get_tree().create_timer(3), "timeout")
	text = 'Emaris: \n-Comment puis-je rentrer chez moi?'
	yield(get_tree().create_timer(3), "timeout")
	text = 'Nix:\n-Comment sortir d ici?!?? \nDésolé de t annoncer ça mais tu ne peut pas. '
	yield(get_tree().create_timer(3), "timeout")
	text = 'Nix:\n-A moins d explorer ce monde et \nd affronter le maitres des pantins... '
	yield(get_tree().create_timer(3), "timeout")
	text = 'Nix:\n-Et c est difficile,\nj en ai perdu mon corp...'
	yield(get_tree().create_timer(3), "timeout")
	text = 'Emaris:\n-Bon je suis obligé de le faire...' 
	yield(get_tree().create_timer(3), "timeout")
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
