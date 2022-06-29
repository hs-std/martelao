extends TextureRect
export (Array, Resource) var res_head
onready var textl = get_parent().get_node("Text/Label")
onready var textr = get_parent().get_node("Text2/Label")
onready var lock = get_node("Lock")
onready var ctrl = 0
onready var time_in
onready var time_out
onready var time_cooldown
onready var hammer_force
onready var head_name
onready var about
onready var id


func _ready():
	data_update()

func change_left():
	if ctrl != 0:
		ctrl -= 1
	data_update()
	
	
func change_right():
	if ctrl < (res_head.size()-1):
		ctrl += 1
	data_update()

func data_update():
	self.texture = res_head[ctrl].head
	time_in = res_head[ctrl].time_in
	time_out = res_head[ctrl].time_out
	time_cooldown = res_head[ctrl].time_cooldown
	hammer_force = res_head[ctrl].hammer_force
	head_name = res_head[ctrl].name
	about = res_head[ctrl].about
	textl.text = head_name
	textr.text = about
	Global.head = res_head[ctrl]
	_block()


func _on_CableArrowRight_pressed():
	change_right()


func _on_CableArrowLeft_pressed():
	change_left()


func _block():
	if Global.id_h >= res_head[ctrl].id:
		lock.hide()
		Global.block_h = false
	else:
		lock.show()
		Global.block_h = true
		
