extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Max score: " + str(Autoload.save_data.max_score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
