extends Node2D

onready var paddle = $Paddle
onready var box = $Box
onready var scores = $Scores
onready var brickArea = $BricksArea
onready var gameOverPopUp = $GameOverPanel
onready var gameOverExitButton = $GameOverPanel/ExitButton
onready var gameOverReplayButton = $GameOverPanel/ReplayButton
onready var continuePopUp = $ContinuePanel
onready var continueExitButton = $ContinuePanel/ExitButton
onready var continueButton = $ContinuePanel/ContinueButton
onready var musicPlayer = $MusicPlayer

onready var save_file = SaveFile.game_data
#onready var GameOverPopUp = preload("res://scenes/hud/GameOver.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball = preload("res://scenes/ball/Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	
	gameOverExitButton.set_position(Vector2(50,225))
	gameOverReplayButton.set_position(Vector2(300,225))
	
	continueExitButton.set_position(Vector2(50,225))
	continueExitButton.set_size(Vector2(332,307))
	continueButton.set_position(Vector2(300,225))
	continueButton.set_size(Vector2(332,307))
	
	var ball_instance = ball.instance()
	ball_instance.position = Vector2(536, 1520)
	add_child(ball_instance) # Replace with function body.
	
	musicPlayer.set_volume_db(save_file["music_volume"])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	musicPlayer.set_volume_db(save_file["music_volume"])

func _on_Box_bottom_hit():
	get_tree().paused = true
	gameOverPopUp.popup()

func _on_ContinuePanel_next_level():
	get_tree().paused = false
	get_tree().reload_current_scene()

func brick_destroyed():
	brickArea.brick_count-=1
	if brickArea.brick_count == 0:
		get_tree().paused = true
		continuePopUp.popup()

