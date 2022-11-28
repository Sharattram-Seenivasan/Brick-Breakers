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
onready var ColorblindButton = $"ColorblindButton"

onready var save_file = SaveFile.game_data

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	musicSlider.set_value(save_file["music_volume"])
	soundEffectsSlider.set_value(save_file["sound_effects_volume"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	musicSlider.set_value(save_file["music_volume"])
#	soundEffectsSlider.set_value(save_file["sound_effects_volume"])


func _on_SoundEffectsSlider_drag_ended(value_changed):
	if value_changed:
		print("changed")


func _on_MusicSlider_drag_ended(value_changed):
	if value_changed:
		save_file["music_volume"] = musicSlider.get_value()
		SaveFile.save_data()


func _on_ExitButton_pressed():
	get_tree().change_scene("res://scenes/StartScreen.tscn")
