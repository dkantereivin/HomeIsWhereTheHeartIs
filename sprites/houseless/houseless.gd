extends AnimatedSprite2D

var DBox: PackedScene = preload("res://sprites/dialog_box/dbox.tscn")

@export var dialogue_file: String
@export var dbox_offset: Vector2 = Vector2(125, -25)

@onready var ROOT = get_tree().get_root()

var dialogue_position = -1
var dialogue: Array
var dbox: Node2D = null

func start_dialogue():
	var file = FileAccess.open(dialogue_file, FileAccess.READ)
	var content = file.get_as_text()
	
	dialogue = JSON.parse_string(content)
	
	advance_dialogue()


func advance_dialogue():
	if dbox != null:
		ROOT.remove_child(dbox)
		dbox = null
	
	
	dialogue_position += 1
	
	if dialogue_position >= dialogue.size():
		return
	
	dbox = DBox.instantiate()
	dbox.text = dialogue[dialogue_position].dialog
	dbox.set_position(self.get_position() + dbox_offset)
	ROOT.add_child(dbox)

