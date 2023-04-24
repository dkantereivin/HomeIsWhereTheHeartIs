extends Node2D

@onready var player = get_node("Player")
@onready var bus = get_node("Bus")

func _physics_process(_delta):
	if Input.is_action_just_pressed("interact"):
		interact()
		
func interact():
	if player.get_position().distance_to(bus.get_position()) < 40:
		var dialogue = load("res://sprites/BusBoarding.dialogue")
		DialogueManager.dialogue_ended.connect(advance_scene)
		DialogueManager.show_example_dialogue_balloon(dialogue)

func advance_scene(_resource):
	print("GOING FORWARD")
	DialogueManager.dialogue_ended.disconnect(advance_scene)
