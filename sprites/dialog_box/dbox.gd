extends Sprite2D

@export var charsPerSecond = 10 # chars per second
@export var text: String = "-- PLACEHOLDER --"

@onready var label: Label = get_node("Label")
@onready var timer = Timer.new()

var visibleChars = 0

func _ready():
	label.set_visible_characters(visibleChars)
	label.set_text(text)
	
	add_child(timer)
	timer.connect("timeout", on_tick)
	
	timer.set_wait_time(1.0 / charsPerSecond)
	timer.set_one_shot(false)
	timer.start()

func on_tick():
	visibleChars += 1
	label.set_visible_characters(visibleChars)
	
	if visibleChars > text.length():
		timer.stop()
