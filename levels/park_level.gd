extends Node2D

@onready var player = get_node("Player")
@onready var tools = get_node("Tools")
@onready var hotdogs = get_node("HotdogStand")

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		interact()
	if PlayerVars.completed.size() == 2 and not $CutscenePlayer.is_playing():
		$CutscenePlayer.play("RESET")

func interact():
	for houseless in get_node("HouselessGroup").get_children():
		if player.get_position().distance_to(houseless.get_position()) < 50:
			var resource_path = "res://sprites/houseless/dialogues/%s.dialogue"
			var dialogue = load(resource_path % (houseless.name + "Quest" if houseless.name in PlayerVars.quests else houseless.name))
			DialogueManager.show_example_dialogue_balloon(dialogue)
			return
			
	for sign in get_node("SignsGroup").get_children():
		var dialogue = load("res://sprites/%s.dialogue" % sign.name)
		if player.get_position().distance_to(sign.get_position()) < 25:
			DialogueManager.show_example_dialogue_balloon(dialogue)
			
	if player.get_position().distance_to(tools.get_position()) < 25:
		PlayerVars.inventory += ["Tools"]
		remove_child(tools)
		
		var dialogue = load("res://sprites/Tool.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)
	
	if player.get_position().distance_to(hotdogs.get_position()) < 40:
		var dialogue = load("res://sprites/HotdogStand.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)


func game_end(anim_name):
	get_tree().quit()
