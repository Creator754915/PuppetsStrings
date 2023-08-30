extends OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Arrows", -1)
	add_item("ZQSD", 0)


func _process(delta):
	var item_select = get_item_text(selected)
	print(item_select)
