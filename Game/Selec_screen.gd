extends Control


func _on_Back_pressed():
	var _scene = get_tree().change_scene("res://UI/Menu.tscn")
	queue_free()


func _on_Start_pressed():

	if !Global.block_c and !Global.block_h:
		var _scene = get_tree().change_scene("res://Game/Game.tscn")
		queue_free()
	else:
		print("Bloqueado")

