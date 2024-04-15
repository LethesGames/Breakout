extends Node2D

var current_score:int = 0
var current_score_label
var remaining_lives:int = 3
var remaining_lives_label
var ball
var paddle


# Called when the node enters the scene tree for the first time.
func _ready():
	current_score_label = get_node(
		"Hud/Panel/HBoxContainer/MarginContainer3/CurrentScoreLabel")
	remaining_lives_label = get_node("Hud/Panel/HBoxContainer/MarginContainer/LivesLabel")
	ball = get_node("Ball")
	paddle = get_node("Paddle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func add_point():
	current_score += 1
	current_score_label.update_text(current_score)
	

func subtract_live():
	remaining_lives -= 1
	remaining_lives_label.update_text(remaining_lives)
	if remaining_lives <= 0 :
		update_max_score()
		end_game()
	else:
		pass
		#funcions de reposicionamento directamente nos nodos correspondentes
		ball.reposition()
		paddle.reposition()

			
func update_max_score():
	var max_score = Autoload.save_data.max_score
	if current_score > max_score:
		Autoload.save_data.max_score = current_score
		Autoload.save_data.save()
	

func end_game():
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
