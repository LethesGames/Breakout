extends Area2D

var speed = 200
var direction = Vector2(0, 1)
var initialPosition = Vector2(581, 339)
var paddle
var livesLabel
var audioPlayer
var currentScore:int
var brickNumber:int = 48

# Called when the node enters the scene tree for the first time.
func _ready():
	livesLabel = get_parent().get_node("Hud/Panel/HBoxContainer/MarginContainer/LivesLabel")
	audioPlayer = get_parent().get_node("AudioStreamPlayer2D")
	paddle = get_parent().get_node("Paddle")
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
		direction = (direction + Vector2(0, 2)).normalized()
	elif area.name == "BottomWall":
		get_tree().call_group("Game", "subtract_live")


func reposition():
	speed = 200
	direction = Vector2(0, 1)
	position = initialPosition
