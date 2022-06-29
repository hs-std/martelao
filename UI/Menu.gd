extends Control

func _ready():
	Audios.play_music()

func _on_About_pressed():
	var _scene = get_tree().change_scene("res://UI/About.tscn")
	queue_free()
	


func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Game/Selec_screen.tscn") 
	queue_free()


func _on_Exit_pressed():
	get_tree().quit()
