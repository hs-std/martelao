extends Control



func _on_Back_pressed():
	var scene = get_tree().change_scene("res://UI/Menu.tscn")
	queue_free()
