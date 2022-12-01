extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var brick = preload("res://scenes/brick/Brick.tscn")
var brick_width = 72
var brick_height = 38
var brick_count = 0

var x_start = 0 + brick_width
var y_start = 200

#var x_end = 1080
#var y_end = 740
var x_end = 1050
var y_end = 740

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():	
	var x = x_start
	while x <= x_end:
		var y = y_start
		while y <= y_end:
			rng.randomize()
			if rng.randf() <= 0.33:
				var newBrick = brick.instance()
				newBrick.position = Vector2(x, y)
				add_child(newBrick)
				newBrick.connect("brick_destroyed", get_parent().get_node("Scores"), "brick_destroyed")
				newBrick.connect("brick_destroyed", get_parent(), "brick_destroyed")
				brick_count+=1
			y += brick_height
		x += brick_width


## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
