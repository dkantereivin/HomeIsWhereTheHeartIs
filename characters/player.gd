extends CharacterBody2D

@export var move_speed: float = 100.0
@export var starting_direction: Vector2 = Vector2(0, 1)

@onready var anim_tree = $AnimationTree
@onready var anim_state_machine = anim_tree.get("parameters/playback")

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
	if (move_direction != Vector2.ZERO):
		anim_tree.set("parameters/Walk/blend_position", move_direction)
		anim_tree.set("parameters/Idle/blend_position", move_direction)
	
	anim_state_machine.travel("Idle" if velocity == Vector2.ZERO else "Walk")
