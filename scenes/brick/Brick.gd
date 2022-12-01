extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var green_texture = load("res://icons/green_block.png")
onready var yellow_texture = load("res://icons/yellow_block.png")
onready var red_texture = load("res://icons/red_block.png")

onready var brick_sprite = get_node("BrickSprite")
onready var brickHitbox = get_node("CollisionShape2D")

var health = 2

signal brick_destroyed

# Called when the node enters the scene tree for the first time.
func _ready():
	brick_sprite.set_scale(Vector2(1.2,1.2))
	brickHitbox.set_scale(Vector2(1.2,1.2))

func get_health():
	return health

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	switch_texture(health)

func switch_texture(health):
#	if health == 3:
#		brick_sprite.set_texture(green_texture)
#	elif health == 2:
#		brick_sprite.set_texture(yellow_texture)
#	elif health == 1:
#		brick_sprite.set_texture(red_texture)
	if health == 2:
		brick_sprite.set_texture(green_texture)
	elif health == 1:
		brick_sprite.set_texture(red_texture)

func damage():
	health -= 1
	switch_texture(health)
	if health <= 0:
		emit_signal("brick_destroyed")
		queue_free()
