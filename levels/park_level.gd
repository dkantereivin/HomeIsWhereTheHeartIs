extends Node2D

@onready var player = get_node("Player")

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		interact()

func interact():
	for houseless in get_node("HouselessGroup").get_children():
		if player.get_position().distance_to(houseless.get_position()) < 50:
			var resource_path = "res://sprites/houseless/dialogues/%s.dialogue"
			var dialogue = load(resource_path % houseless.name)
			await DialogueManager.show_example_dialogue_balloon(dialogue)
			return
			
