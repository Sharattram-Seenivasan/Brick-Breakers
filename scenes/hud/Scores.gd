extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var save_file = SaveFile.game_data
onready var ScoreLabel = $Score	
onready var HighScoreLabel = $HighScore
onready var TimeLabel = $Time
#var score = SaveFile.sessionScore
#var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreLabel.bbcode_text = "[color=black] Score: " + str(SaveFile.sessionScore) + "[/color]"
	HighScoreLabel.bbcode_text = "[color=black] High Score: " + str(save_file["high_score"]) + "[/color]"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	SaveFile.sessionTime += delta
	TimeLabel.bbcode_text = "[color=black] Time: " + str(int(SaveFile.sessionTime)) + "[/color]"

func brick_destroyed():
	SaveFile.sessionScore += 5
	if SaveFile.sessionScore > save_file["high_score"]:
		save_file["high_score"] = SaveFile.sessionScore
		HighScoreLabel.bbcode_text = "[color=black] High Score: " + str(SaveFile.sessionScore) + "[/color]"
		SaveFile.save_data()
	ScoreLabel.bbcode_text =  "[color=black] Score: " + str(SaveFile.sessionScore) + "[/color]"
	


