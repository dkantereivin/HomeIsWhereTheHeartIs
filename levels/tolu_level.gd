extends Node2D

@onready var player = get_node("Player")
@onready var tolu = get_node("Tolu")

func _ready():
	var dialogue = load("res://sprites/Paramedics.dialogue")
	DialogueManager.show_example_dialogue_balloon(dialogue)
	

func _physics_process(_delta):
	if Input.is_action_just_pressed("interact"):
		interact()
		
func interact():
	if player.get_position().distance_to(tolu.get_position()) < 25:
		var dialogue = load("res://characters/Tolu/Initial.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)

