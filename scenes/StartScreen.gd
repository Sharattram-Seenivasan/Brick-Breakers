extends Node2D

onready var muteButton = $MuteButton
onready var audio_player = $MusicPlayer

# textures
onready var deafened = load("res://icons/Deafened.png")
onready var undeafened = load("res://icons/Undeafened.png")


onready var save_file = SaveFile.game_data


# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.set_volume_db(save_file["music_volume"])
	tryMute()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	
