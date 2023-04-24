extends Node2D

func advance_scene():
	get_tree().change_scene_to_file("res://levels/tolu_level.tscn")


func _on_timer_timeout():
	advance_scene()
	

func _ready():
	var dialogue = load("res://sprites/High.dialogue")
	DialogueManager.show_example_dialogue_balloon(dialogue)
