extends KinematicBody2D

signal scored(hit_point)

var speed = 250

var velocity = Vector2()
var screen_size
var damage = 3

func _ready():
	get_viewport().set_size(Vector2(1080,1920))
	screen_size = get_viewport_rect().size	
	position = Vector2(screen_size.x/ 2, screen_size.y - 600)
	velocity = Vector2(0, -1) * speed
	
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		handle_collision(collision.collider)


func handle_collision(collider):
	if collider.has_method("damage"):
		collider.damage()
