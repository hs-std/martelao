extends CanvasLayer
onready var result : Label = get_node("MarginContainer/VBoxContainer/HBoxContainer/Panel/MarginContainer/VBoxContainer/Result")


func _ready():
	_score()

func _on_Again_pressed():
	var _scene = get_tree().change_scene("res://Game/Selec_screen.tscn")
	get_tree().paused = false
	get_parent().queue_free()


func _score():
	if Global.points > Global.record:
		result.text = "Novo Record:\n" + str(Global.points)
		Global.record = Global.points
		Global.points = 0
		Global.time = 1
		Global.spown_time = 1
	else:
		result.text = "Seus Pontos:\n" + str(Global.points) + "\nSeu Redord:\n" + str(Global.record)
		Global.points = 0
