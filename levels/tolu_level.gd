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
	if player.get_position().distance_to(tolu.get_position()) < 75:
		if "Tolu" in PlayerVars.quests:
			if "ToluFood" in PlayerVars.inventory:
				var dialogue = load("res://characters/Tolu/Finish.dialogue")
				DialogueManager.show_example_dialogue_balloon(dialogue)
		else:
			var dialogue = load("res://characters/Tolu/Initial.dialogue")
			DialogueManager.show_example_dialogue_balloon(dialogue)

func _on_market_trigger_box_body_entered(body):
	if body == player and "Tolu" in PlayerVars.quests:
		var dialogue = load("res://characters/tolu/ToluFood.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)


func _on_next_level_trigger_body_entered(body):
	get_tree().change_scene_to_file("res://levels/park_level.tscn")
