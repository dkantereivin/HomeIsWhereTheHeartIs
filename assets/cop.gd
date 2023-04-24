extends RigidBody2D

const SPEED = 50
const IMPULSE = 2000
var direction = 1
var animated_sprite

func _ready():
	animated_sprite = $AnimatedSprite2D
	animated_sprite.play("right")
	position = Vector2(500, 250)

func _process(delta):
	var velocity = Vector2(direction * SPEED, 0)

	if direction == -1:
		animated_sprite.play("left")
		$AnimatedSprite2D.flip_h = true
	else:
		animated_sprite.play("right")
		$AnimatedSprite2D.flip_h = false

	velocity *= delta
	position += velocity
	apply_central_impulse(Vector2(direction * IMPULSE * delta, 0))

	if position.x > 500:
		position.x = 500
		direction = -1
		await get_tree().create_timer(1.0).timeout
		$AnimatedSprite2D.flip_h = true
	elif position.x < 100:
		position.x = 100
		direction = 1
		await get_tree().create_timer(1.0).timeout
		$AnimatedSprite2D.flip_h = false
