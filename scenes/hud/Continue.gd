extends PopupPanel
signal next_level


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_ExitButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/StartScreen.tscn")


func _on_ContinueButton_pressed():
	emit_signal("next_level")


