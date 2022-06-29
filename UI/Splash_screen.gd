extends Control


func _on_VideoPlayer_finished():
	var _scene = get_tree().change_scene("res://UI/Menu.tscn")
	queue_free()
