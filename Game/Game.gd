extends Node2D
onready var end_screen = preload("res://UI/End_game.tscn")
onready var popup = preload("res://UI/Popup.tscn")
onready var cor = get_node("ColorRect")
onready var world = get_node("World")
onready var HUD = get_node("HUD")
var des : bool = false
var end
var pop

func _ready():
	cor.hide()


func _on_HUD_end():
	cor.show()
	end = end_screen.instance()
	get_tree().paused = true
	self.add_child(end)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#
func on_hammer(_data):
	HUD.more_time(4)
	HUD.more_points(10 + _data)
	_point_popup()
	
func on_especial_hammer():
	HUD.especial_on()
	
func _popup():
	pop = popup.instance()
	self.add_child(pop)
	des = false
	
func _point_popup():
	if Global.points == 100:
		des = true
		Global.id_h = 1 # 1
	elif Global.points == 150:
		des = true
		Global.id_c = 1 # 1
	elif Global.points == 200:
		des = true
		Global.id_h = 2 # 2
	elif Global.points == 300:
		des = true
		Global.id_c = 2 # 2 Acabou
	elif Global.points == 500:
		des = true
		Global.id_h = 3 # 3
	elif Global.points == 700:
		des = true
		Global.id_h = 4 # 4 Acabou
	if des:
		_popup()
		
		
		
