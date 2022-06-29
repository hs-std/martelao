extends Node2D
onready var nail = preload("res://Game/Nail/Nail.tscn")
onready var timer = get_node("Timer")
var i
const time = 5


func _process(delta):
	var _i = delta
	timer.wait_time = time/Global.spown_time
	pass

func _instance():
	i = nail.instance()
	i.connect("hammer",get_parent(),"on_hammer")
	i.connect("hammer",get_parent().get_node("Hammer-Game"),"on_hammer")
	i.connect("especial_hammer",get_parent(),"on_especial_hammer")
	add_child(i)

func _on_Timer_timeout():
	_instance()
	pass
