extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	var maxScore:int = Autoload.save_data.max_score
	get_node("MaxScoreLabel").text = "Max Score: " + str(maxScore)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
