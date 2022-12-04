extends Node

const SAVE_FILE = "user://save_file.save"

var sessionScore = 0
var sessionTime = 0
var game_data = {}


func _ready():
	load_data()


func save_data():
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		game_data = {
			"sound_effects_volume": 0.0,
			"music_volume": -10.0,
			"ball_speed": 650,
			"paddle_size": 0.5,
			"paddle_speed": 650,
			"colorblind_mode": false,
			"high_score": 0,
		}
		save_data()
	file.open(SAVE_FILE, File.READ)
	game_data = file.get_var()
	file.close()
