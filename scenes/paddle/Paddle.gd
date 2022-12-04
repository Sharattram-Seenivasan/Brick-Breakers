extends StaticBody2D


onready var paddleSprite = $Sprite
onready var paddleCollisionShape = $CollisionPolygon2D
onready var save_file = SaveFile.game_data

var MOVE_SPEED;
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	paddleSprite.set_scale(Vector2(save_file["paddle_size"],0.5))
	paddleCollisionShape.set_scale(Vector2(save_file["paddle_size"]*2,1))
	
	if save_file.has("paddle_speed"):
		MOVE_SPEED = save_file["paddle_speed"]
	else:
		MOVE_SPEED = 650
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	position += velocity * delta
	position.x = clamp(position.x, 128, 1080-128)

func move():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1
	velocity = velocity.normalized()*MOVE_SPEED
	
