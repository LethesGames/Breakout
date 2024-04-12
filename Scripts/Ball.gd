extends Area2D

var speed = 200
var direction = Vector2(0, 1)
var initialPosition = Vector2(581, 339)
var initialPaddlePosition = Vector2(585, 604)
var paddle
var livesLabel
var audioPlayer
var maxScore:int
var currentScore:int
var brickNumber:int = 48

# Called when the node enters the scene tree for the first time.
func _ready():
	livesLabel = get_parent().get_node("Hud/Panel/HBoxContainer/MarginContainer/LivesLabel")
	audioPlayer = get_parent().get_node("AudioStreamPlayer2D")
	paddle = get_parent().get_node("Paddle")
	maxScore = Autoload.saveData.maxScore
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * delta * direction
	if(currentScore == brickNumber):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	pass

func _on_area_entered(area):
	
	audioPlayer.set_pitch_scale(randf_range(1, 4))
	audioPlayer.play()
	
	if area.name == "Paddle":
		direction = (direction + Vector2(randf() * 2 - 1, -2)).normalized()
	elif area.name == "RightWall":
		direction = (direction + Vector2(-2, 0)).normalized()
	elif area.name == "LeftWall":
		direction = (direction + Vector2(2, 0)).normalized()
	elif area.name == "TopWall":
		#TODO: encoger paddle cuando tocamos el techo (solo la primera vez o algo continuo?)
		direction = (direction + Vector2(0, 2)).normalized()
	elif area.name == "BottomWall":
		var livesRemaining = int(livesLabel.text) - 1
		if livesRemaining <= 0:
			livesLabel.text = "Lives: " + str(livesRemaining)
			currentScore = int(get_parent().get_node("Hud/Panel/HBoxContainer/MarginContainer3/CurrentScoreLabel").text)
			if currentScore > maxScore:
				maxScore = currentScore
				Autoload.saveData.maxScore = maxScore
				Autoload.saveData.save()
			get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
		else:
			livesLabel.text = "Lives: " + str(livesRemaining) 
			speed = 200
			position = initialPosition
			paddle.position = initialPaddlePosition
			direction = Vector2(0, 1) #TODO: provisional mientras no decidamos el comportamiento inicial de la bola	
