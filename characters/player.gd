extends CharacterBody2D

@export var move_speed: float = 100.0

func _physics_process(_delta):
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
	velocity = direction * move_speed
	
	move_and_slide()
