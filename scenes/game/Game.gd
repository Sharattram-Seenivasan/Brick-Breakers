extends Node2D

onready var paddle = $Paddle

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball = preload("res://scenes/ball/Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	add_child(ball.instance()) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LeftArrow_pressed():
	paddle.setMovingLeft(true)

func _on_RightArrow_pressed():
	paddle.setMovingRight(true)

func _on_LeftArrow_released():
	paddle.setMovingLeft(false)

func _on_RightArrow_released():
	paddle.setMovingRight(false)
