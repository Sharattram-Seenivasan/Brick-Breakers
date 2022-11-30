extends Node2D

onready var muteButton = $Container/MuteButton
onready var audio_player = $Container/MusicPlayer
onready var colorblindnessLayer = $"Colorblindness"

# textures
onready var deafened = load("res://icons/Deafened.png")
onready var undeafened = load("res://icons/Undeafened.png")


onready var save_file = SaveFile.game_data


# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	audio_player.set_volume_db(save_file["music_volume"])
	
	if save_file["colorblind_mode"]:
		colorblindnessLayer.Type = colorblindnessLayer.TYPE.Achromatopsia
	
	if audio_player.get_volume_db() <= -60:
		muteButton.set_normal_texture(deafened)
	else:
		muteButton.set_normal_texture(undeafened)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if save_file["colorblind_mode"]:
		colorblindnessLayer.Type = colorblindnessLayer.TYPE.Achromatopsia
	else:
		colorblindnessLayer.Type = colorblindnessLayer.TYPE.None
	
	audio_player.set_volume_db(save_file["music_volume"]) 


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://scenes/Settings.tscn")

func tryMute():
	if audio_player.get_volume_db() <= -60:
		save_file["music_volume"] = 0
		muteButton.set_normal_texture(undeafened)
	else:
		save_file["music_volume"] = -60
		muteButton.set_normal_texture(deafened)

func _on_MuteButton_pressed():
	tryMute()
	


func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/game/Game.tscn")
