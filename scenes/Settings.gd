extends Node2D

onready var background = $Background
onready var exitButton = $ExitButton
onready var soundEffectsSlider = $"SoundEffectsSlider"
onready var musicSlider = $"MusicSlider"
onready var fastButton = $"FastButton"
onready var ballMediumButton = $"BallMediumButton"
onready var slowButton = $"SlowButton"
onready var largeButton = $"LargeButton"
onready var PaddleMediumButton = $"PaddleMediumButton"
onready var SmallButton = $"SmallButton"
onready var paddleSlowButton = $"SlowPaddleSpeedButton"
onready var paddleMediumButton = $"MediumPaddleSpeedButton"
onready var paddleFastButton = $"FastPaddleSpeedButton"
onready var save_file = SaveFile.game_data

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	musicSlider.set_value(save_file["music_volume"])
	soundEffectsSlider.set_value(save_file["sound_effects_volume"])
	
	if save_file.has("ball_speed"):
		if save_file["ball_speed"] == 450:
			slowButton.pressed = true
		elif save_file["ball_speed"] == 650:
			ballMediumButton.pressed = true
		elif save_file["ball_speed"] == 850:
			fastButton.pressed = true
	else:
		save_file["ball_speed"] = 650
		SaveFile.save_data()
		ballMediumButton.pressed = true
		
	
	if save_file.has("paddle_size"):
		if save_file["paddle_size"] == 0.75:
			largeButton.pressed = true
		elif save_file["paddle_size"] == 0.50:
			PaddleMediumButton.pressed = true
		elif save_file["paddle_size"] == 0.25:
			SmallButton.pressed = true
	else:
		save_file["paddle_size"] = 0.50
		SaveFile.save_data()
		PaddleMediumButton.pressed = true
	
	if save_file.has("paddle_speed"):
		if save_file["paddle_speed"] == 450:
			paddleSlowButton.pressed = true
		elif save_file["paddle_speed"] == 650:
			paddleMediumButton.pressed = true
		elif save_file["paddle_speed"] == 850:
			paddleFastButton.pressed = true
	else:
		save_file["paddle_speed"] = 650
		SaveFile.save_data()
		paddleMediumButton.pressed = true
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_SoundEffectsSlider_drag_ended(value_changed):
	if value_changed:
		save_file["sound_effects_volume"] = soundEffectsSlider.get_value()
		SaveFile.save_data()


func _on_MusicSlider_drag_ended(value_changed):
	if value_changed:
		save_file["music_volume"] = musicSlider.get_value()
		SaveFile.save_data()


func _on_ExitButton_pressed():
	get_tree().change_scene("res://scenes/StartScreen.tscn")


func _on_SlowButton_toggled(_button_pressed):
	save_file["ball_speed"] = 450
	SaveFile.save_data()

func _on_BallMediumButton_toggled(_button_pressed):
	save_file["ball_speed"] = 650
	SaveFile.save_data()

func _on_FastButton_toggled(_button_pressed):
	save_file["ball_speed"] = 850
	SaveFile.save_data()


func _on_LargeButton_toggled(button_pressed):
	save_file["paddle_size"] = 0.75 
	SaveFile.save_data()


func _on_PaddleMediumButton_toggled(button_pressed):
	save_file["paddle_size"] = 0.5
	SaveFile.save_data()


func _on_SmallButton_toggled(button_pressed):
	save_file["paddle_size"] = 0.25
	SaveFile.save_data()


func _on_SlowPaddleSpeedButton_toggled(button_pressed):
	save_file["paddle_speed"] = 450
	SaveFile.save_data()

func _on_MediumPaddleSpeedButton_toggled(button_pressed):
	save_file["paddle_speed"] = 650
	SaveFile.save_data()


func _on_FastPaddleSpeedButton_toggled(button_pressed):
	save_file["paddle_speed"] = 850
	SaveFile.save_data()
