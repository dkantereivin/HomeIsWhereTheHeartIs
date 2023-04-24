extends Node2D

@onready var player = get_node("Player")
@onready var flier = get_node("Flier")
@onready var linda = get_node("Linda")
@onready var odkid = get_node("NeedleODTrigger/KidOD")
@onready var needle = get_node("NeedleODTrigger/Needle")

func _physics_process(_delta):
	if Input.is_action_just_pressed("interact"):
		interact()
		
func interact():
	if player.get_position().distance_to(linda.get_position()) < 25:
		var dialogue_linda
		if "Flier" not in PlayerVars.quests:
			dialogue_linda = load("res://characters/linda/Initial.dialogue")
		# mutually exclusive above below
		if "Hygiene" in PlayerVars.inventory:
			dialogue_linda = load("res://characters/linda/AfterHygiene.dialogue")
		elif "HygieneRejected" not in PlayerVars.completed:
			dialogue_linda = load("res://characters/linda/AfterFlier.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue_linda)
			
	
	if player.get_position().distance_to(flier.get_position()) < 40:
		if "Knowledge" in PlayerVars.inventory: return
		var dialogue = load("res://sprites/Flier.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)
		
	if player.get_position().distance_to(odkid.get_position()) and odstarted:
		var dialogue = load("res://sprites/FirstAid.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)
		

func shoparea_entered():
	if "Hygiene" not in PlayerVars.quests:
		return
	var dialogue = load("res://characters/linda/Hygiene.dialogue")
	DialogueManager.show_example_dialogue_balloon(dialogue)

func advance_scene(_resource):
	DialogueManager.dialogue_ended.disconnect(advance_scene)


func _on_shop_trigger_area_body_body_entered(body):
	if body == player:
		shoparea_entered()

var teenager_spoken = false
func _on_teenager_trigger_area_body_entered(body):
	if body == player and not teenager_spoken:
		teenager_spoken = true
		var dialogue = load("res://characters/misc/Teenager.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)

var snobbywoman_spoken = false
func _on_snobby_woman_trigger_area_body_entered(body):
	if body == player and not snobbywoman_spoken:
		snobbywoman_spoken = true
		var dialogue = load("res://characters/misc/SnobbyWoman.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)


var odstarted = false
func _on_needle_od_trigger_body_entered(body):
	if not needle.is_visible_in_tree(): return
	if body == player and not odstarted:
		odstarted = true
		var dialogue = load("res://sprites/Needle.dialogue")
		DialogueManager.show_example_dialogue_balloon(dialogue)

