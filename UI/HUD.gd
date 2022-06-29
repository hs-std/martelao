extends CanvasLayer
onready var text_time : Label = get_node("MarginContainer2/VBoxContainer/HBoxContainer/TextureRect/Label")
onready var text_points : Label = get_node("MarginContainer/VBoxContainer/HBoxContainer/TextureRect/Points")
onready var especial : TextureProgress = get_node("MarginContainer/VBoxContainer/HBoxContainer/TextureRect/TextureProgress")
onready var especial_timer : Timer = get_node("MarginContainer/VBoxContainer/HBoxContainer/TextureRect/TextureProgress/Especial_timer")
onready var time = 10
signal end


func _process(delta):
	var _o = delta
	text_points.text = "Pontos: " + str(Global.points)
	if time < 10:
		text_time.text = str("0") + str(time)
	else:
		text_time.text = str(time)
	if especial.value <= 0:
		Global.esp_aim = false
		Global.esp_vel = false

func _on_Timer_timeout():
	if time > 0:
		time -= 1
	else:
		emit_signal("end")


func more_time(_t : int):
	time += _t


func more_points(_data : int):
	Global.points += _data
	Global.time += 0.5
	Global.spown_time += 0.5
	
	

func _on_Especial_timer_timeout():
	if especial.value > 0:
		especial.value -= 1
	else:
		especial_timer.stop()


func especial_on():
	especial.value = 100
	especial_timer.start()
	
	
