extends Area2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left") && position.x > 117:
		position.x -= speed * delta
		
	if Input.is_action_pressed("move_right") && position.x < 1041:
		position.x += speed * delta
