extends TextureRect
export (Array, Resource) var res_cable
onready var textl = get_parent().get_node("Text/Label")
onready var textr = get_parent().get_node("Text2/Label")
onready var lock = get_node("Lock")
onready var ctrl = 0
onready var time_in
onready var time_out
onready var time_cooldown
onready var hammer_force
onready var cable_name
onready var about
onready var id


func _ready():
	data_update()

func change_left():
	if ctrl != 0:
		ctrl -= 1
	data_update()
	
	
func change_right():
	if ctrl < (res_cable.size()-1):
		ctrl += 1
	data_update()

func data_update():
	self.texture = res_cable[ctrl].cable
	time_in = res_cable[ctrl].time_in
	time_out = res_cable[ctrl].time_out
	time_cooldown = res_cable[ctrl].time_cooldown
	hammer_force = res_cable[ctrl].hammer_force
	cable_name = res_cable[ctrl].name
	about = res_cable[ctrl].about
	textl.text = cable_name
	textr.text = about
	Global.cable = res_cable[ctrl]
	_block()
	

func _on_CableArrowRight_pressed():
	change_right()


func _on_CableArrowLeft_pressed():
	change_left()


func _block():
	if Global.id_c >= res_cable[ctrl].id:
		lock.hide()
		Global.block_c = false
	else:
		lock.show()
		Global.block_c = true
		
