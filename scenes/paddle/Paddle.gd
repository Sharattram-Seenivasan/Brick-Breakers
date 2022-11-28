extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const MOVE_SPEED = 100;
var is_moving_right = false
var is_moving_left = false
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	position += velocity * delta
	position.x = clamp(position.x, 0, 1080)

func move():
	velocity = Vector2()
	if is_moving_right:
		velocity.x += 1 
	if is_moving_left:
		velocity.x += -1
	velocity = velocity.normalized()*MOVE_SPEED
	
func setMovingRight(isMovingRight):
	is_moving_right = isMovingRight

func setMovingLeft(isMovingLeft):
	is_moving_left = isMovingLeft
