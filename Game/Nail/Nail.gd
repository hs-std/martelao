extends Area2D
enum list {Aim, Velocity,Commum}
export (list) var type = list.Commum
onready var img = get_node("Sprite2")
onready var col = get_node("CollisionShape2D")
onready var head = preload("res://Game/Nail/Nail_head.png")
onready var nail = preload("res://Game/Nail/Nail.png")
var pos_x
var pos_y
var bonus = 0
const time = 10
signal hammer
signal especial_hammer

func _ready():
	col.disabled = false
	_ramdom_type()
	_type_nail()
	pos_x = rand_range(290, 1300)
	pos_y = rand_range(165, 760)
	self.position = Vector2(pos_x,pos_y)
	img.texture = nail
	var _time = time/Global.time
	yield(get_tree().create_timer(_time),"timeout")
	if !get_tree().paused:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("hammer"):
		img.texture = head
		emit_signal("hammer", bonus)
		col.disabled = true
		if type == list.Aim or type == list.Velocity:
			emit_signal("especial_hammer")
			if type == list.Aim:
				Global.esp_aim = true
			if type == list.Velocity:
				Global.esp_vel = true
		

	

func _ramdom_type():
	var _u = rand_range(1,2)
	if _u > 0.9 and _u < 1.1:
		type = list.Aim
		bonus = 10
	elif _u > 1.8 and _u < 2.0:
		type = list.Velocity
		bonus = 10
	else:
		type = list.Commum
		bonus = 0
	print(_u)
	pass



func _type_nail():
	if type == list.Aim:
		modulate = Color("#f21010")
	elif type == list.Velocity:
		modulate = Color("#f4e00a")
	else:
		modulate = Color("#ffffff")
