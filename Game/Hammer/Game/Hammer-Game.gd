extends Node2D
onready var tween = get_node("Hemmer/Tween")
onready var head = get_node("Hemmer/Node2D/Head")
onready var cable = get_node("Hemmer/Node2D/Cable")
onready var collision0 = get_node("Hemmer/KinematicBody2D/0")
onready var collision1 = get_node("Hemmer/KinematicBody2D/1")
onready var collision2 = get_node("Hemmer/KinematicBody2D/2")
onready var collision3 = get_node("Hemmer/KinematicBody2D/3")
onready var collision4 = get_node("Hemmer/KinematicBody2D/4")
onready var hammer = get_node("Hemmer")
onready var aim = get_node("Aim/Sprite")
var time_in
var time_out
var time_cooldown
var hammer_force
var especial : float = 0
var move = true
var collision_ofc : CollisionShape2D
var pos : Vector2
onready var mar : int = 0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	data_update()
	collision0.disabled = true
	collision1.disabled = true
	collision2.disabled = true
	collision3.disabled = true
	collision4.disabled = true

	
func _process(delta):
	var _o = delta
	self.position = self.get_global_mouse_position()
#	if hammer.rotation_degrees < -15:
#		collision_ofc.disabled = false
#	else:
#		collision_ofc.disabled = true
	if Global.esp_vel:
		especial = 0.5
	else:
		especial = 0
	if Global.esp_aim:
		aim.show()
		aim.position = pos
	else:
		aim.hide()

	
func _input(event):
	if event.is_action_pressed("Hammer") or event is InputEventScreenTouch or event is InputEventScreenDrag:
		mar = 0
		if !move:
			return
		move_in()

	
func move_in():
	
	move = false
	tween.interpolate_property(hammer,"rotation_degrees",0,-16,time_in,Tween.TRANS_ELASTIC,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(time_in),"timeout")
	Audios.play_hammer()
	Global.can_pot = true
	collision_ofc.disabled = false
	yield(get_tree().create_timer(time_cooldown),"timeout")
	move_out()
#	collision_ofc.disabled = true
func move_out():
	collision_ofc.disabled = true

	Global.can_pot = false
	tween.interpolate_property(hammer,"rotation_degrees",-16,0,time_out,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(time_out),"timeout")
	move = true
	
	
	

func data_update():
	head.texture = Global.head.head_game
	cable.texture = Global.cable.cable_game
	time_in = (Global.head.time_in + Global.cable.time_in) - especial
	time_out = (Global.head.time_out + Global.cable.time_out) - especial
	time_cooldown = Global.head.time_cooldown + Global.cable.time_cooldown
	hammer_force = Global.head.hammer_force + Global.cable.hammer_force
	_colision_data()

func _colision_data():
	if Global.head.id == 0:
		collision_ofc = collision0
		pos = Vector2(-435,-144)
	elif Global.head.id == 1:
		collision_ofc = collision1
		pos = Vector2(-446,-90)
#
	elif Global.head.id == 2:
		collision_ofc = collision2
		pos = Vector2(-480,-99)
		
	elif Global.head.id == 3:
		collision_ofc = collision3
		pos = Vector2(-446,-93)
	elif Global.head.id == 4:
		collision_ofc = collision4
		pos = Vector2(-415,-70)
		
func on_hammer(_data):
#	collision_ofc.disabled = true
	print("teste")

func can_hit() -> bool:
	if mar == 0:
		return true
	else:
		return false
