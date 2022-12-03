extends Node2D

onready var settingsPopUp = $SettingsPanel
onready var soundEffectsSlider = $SettingsPanel/soundEffectsSlider
onready var soundEffectsLabel = $"SettingsPanel/Sound Effects Volume"
onready var musicSlider = $SettingsPanel/musicSlider
onready var musicLabel = $"SettingsPanel/Music Volume"
onready var closeButton = $SettingsPanel/CloseButton

onready var save_file = SaveFile.game_data
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	musicLabel.set_position(Vector2(11,103))
	musicLabel.set_size(Vector2(361,72))
	
	soundEffectsLabel.set_position(Vector2(16,300))
	soundEffectsLabel.set_size(Vector2(506,137))
	
	musicSlider.set_value(save_file["music_volume"])
	musicSlider.set_position(Vector2(25,180))
	musicSlider.set_size(Vector2(450,20))
	
	soundEffectsSlider.set_value(save_file["sound_effects_volume"])
	soundEffectsSlider.set_position(Vector2(29,400))
	soundEffectsSlider.set_size(Vector2(450,20))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func _on_SettingsButton_pressed():
	get_tree().paused = true
	settingsPopUp.popup()

func _on_musicSlider_drag_ended(value_changed):
	if value_changed:
		save_file["music_volume"] = musicSlider.get_value()
		SaveFile.save_data()


func _on_soundEffectsSlider_drag_ended(value_changed):
	if value_changed:
		save_file["sound_effects_volume"] = soundEffectsSlider.get_value()
		SaveFile.save_data()


func _on_SettingsPanel_popup_hide():
	get_tree().paused = false


func _on_CloseButton_pressed():
	settingsPopUp.hide()
	get_tree().paused = false
