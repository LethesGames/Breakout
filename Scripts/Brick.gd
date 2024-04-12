extends Area2D

var scoreLabel
var rightLimit
var leftLimit
var bottomLimit
var topLimit
var colorPalette:Array = ["0A9396", # ~ Dark cyan
							"94D2BD", # ~ Tiffany Blue
							"EE9B00", # ~ Gamboge
							"CA6702", # ~ Alloy orange
							"BB3E03", # ~ Rust
							"AE2012"] # ~ Rufous

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect").color = Color.html(colorPalette[randi_range(0, colorPalette.size() - 1)])
	scoreLabel = get_parent().get_parent().get_node("Hud/Panel/HBoxContainer/MarginContainer3/CurrentScoreLabel")
	rightLimit = get_node("RightLimit").global_position
	leftLimit = get_node("LeftLimit").global_position
	bottomLimit = get_node("BottomLimit").global_position
	topLimit = get_node("TopLimit").global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "Ball":
		var score = int(scoreLabel.text)
		score = score + 1
		scoreLabel.text = "Score: " + str(score)
		if area.speed < 1000:
			area.speed += 25
		_rebound_on_brick(area)
		queue_free()
		

func _rebound_on_brick(area):
	var ballPosition = area.position
	if leftLimit.x < ballPosition.x && ballPosition.x < rightLimit.x:
		if ballPosition.y < bottomLimit.y:
			#print("Estamos arriba del brick")
			area.direction = Vector2(area.direction.x, -1)
			pass
		else:
			#print("Estamos debajo del brick")
			area.direction = Vector2(area.direction.x, 1)
			pass
	elif  bottomLimit.y < ballPosition.y && ballPosition.y < topLimit.y:
		if ballPosition.x < leftLimit.x:
			#print("Estamo a la izquierda del brick")
			area.direction = Vector2(-1, area.direction.y)
			pass
		else:
			#print("Estamos a la derecha del brick")
			area.direction = Vector2(1, area.direction.y)
			pass	
		pass
	pass
