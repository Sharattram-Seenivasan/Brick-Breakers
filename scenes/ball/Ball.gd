extends KinematicBody2D

onready var GameOverPopUp = preload("res://scenes/hud/GameOver.tscn")
onready var hitSound = $HitSound
onready var save_file = SaveFile.game_data
onready var MOVE_SPEED = save_file["ball_speed"]

var velocity = Vector2()
var screen_size
var rng = RandomNumberGenerator.new()

func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	screen_size = get_viewport_rect().size	
	position = Vector2(screen_size.x/ 2, screen_size.y - 600)
	velocity = Vector2(-1, -1) * MOVE_SPEED
	hitSound.set_volume_db(save_file["sound_effects_volume"])
	

func _process(delta):
	hitSound.set_volume_db(save_file["sound_effects_volume"])

func _physics_process(delta):
	rng.randomize()
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal) + Vector2(rng.randf_range(-0.1, 0.1),0)
		handle_collision(collision.collider)


func handle_collision(collider):
	if collider.has_method("damage"):
		hitSound.play()
		collider.damage()
