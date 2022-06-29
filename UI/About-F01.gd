extends VBoxContainer


func _on_F01_mouse_entered():
	Audios.play_slide()
	self.rect_scale = Vector2(1.02,1.02)
	pass # Replace with function body.


func _on_F01_mouse_exited():
	self.rect_scale = Vector2(1,1)
	pass # Replace with function body.
