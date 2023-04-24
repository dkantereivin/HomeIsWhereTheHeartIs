extends CharacterBody2D

@export var move_speed: float = 100.0
@export var starting_direction: Vector2 = Vector2(0, 1)

func _ready():
	update_animation(starting_direction)

func _physics_process(_delta):
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
	velocity = direction * move_speed
	
	update_animation(direction)
	move_and_slide()
	

func update_animation(move_direction: Vector2):
	if (move_direction == Vector2.ZERO):
		$AnimatedSprite.play("idle")
		return
	
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite.play("down")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("up")
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("left")
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite.play("right")
