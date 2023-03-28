extends Node

var quests = []
var inventory = []
var completed = []

func remove_sign(name: String):
	var group = get_node("/root/ParkLevel/SignsGroup")
	var node = group.get_node(name)
	group.remove_child(node)
	
func sign_exists(name: String):
	var group = get_node("/root/ParkLevel/SignsGroup")
	return group.has_node(name)
