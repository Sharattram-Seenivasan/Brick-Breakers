extends KinematicBody2D


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
#func _process(delta):
#	pass

func _physics_process(delta):
	move()

func move():
	if is_moving_right:
		velocity.x =  MOVE_SPEED
	if is_moving_left:
		velocity.x = -MOVE_SPEED
	move_and_slide(velocity, Vector2.UP)
	
func setMovingRight(isMovingRight):
	is_moving_right = isMovingRight

func setMovingLeft(isMovingLeft):
	is_moving_left = isMovingLeft
