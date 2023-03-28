extends Node2D

var DBox: PackedScene = preload("res://sprites/dialog_box/dbox.tscn")

@onready var player = get_node("Player")

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		interact()

func interact():
	for houseless in get_node("HouselessGroup").get_children():
		if player.get_position().distance_to(houseless.get_position()) < 50:
			houseless.start_dialogue()
			#var dbox = DBox.instantiate()
			#dbox.text = "PENIS IS VERY NICE"
			#dbox.set_position(houseless.get_position() + dbox_offset)
			#add_child(dbox)
			# dbox.show_text()
			# print("IM CLOSE!!!")
			# write interaction dialogue
			return
			
