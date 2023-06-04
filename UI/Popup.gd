extends CanvasLayer
export (Array,Resource) var itens
onready var tween = get_node("Node/MarginContainer/Tween")
onready var tex = get_node("Node/MarginContainer/VBoxContainer/HBoxContainer/Panel/MarginContainer/VBoxContainer/TextureRect")
onready var text = get_node("Node/MarginContainer/VBoxContainer/HBoxContainer/Panel/MarginContainer/VBoxContainer/Text")
onready var margin = get_node("Node")


func _ready():
	_desbloc_c()
	_desbloc_h()
	
	pass
	
func _desbloc_c():
	if Global.id_c == 1 and itens[0].lock:
		tex.texture = itens[0].cable
		text.text = "Você desbloqueou o " + itens[0].name
		itens[0].lock = false
		_move()
		
	if Global.id_c == 2 and itens[1].lock:
		tex.texture = itens[1].cable
		text.text = "Você desbloqueou o " + itens[1].name
		itens[1].lock = false
		_move()
	Global.id_c = 0
		
func _desbloc_h():
	if Global.id_h == 1 and itens[2].lock:
		tex.texture = itens[2].head
		text.text = "Você desbloqueou o " + itens[2].name
		itens[2].lock = false
		_move()
		
	if Global.id_h == 2 and itens[3].lock:
		tex.texture = itens[3].head
		text.text = "Você desbloqueou o " + itens[3].name
		itens[3].lock = false
		_move()
		
	if Global.id_h == 3 and itens[4].lock:
		tex.texture = itens[4].head
		text.text = "Você desbloqueou o " + itens[4].name
		itens[4].lock = false
		_move()
		
	if Global.id_h == 4 and itens[5].lock:
		tex.texture = itens[5].head
		text.text = "Você desbloqueou o " + itens[5].name
		itens[5].lock = false
		_move()
	Global.id_h = 0
		
func _move():
	tween.interpolate_property(margin,"position",Vector2(1266,1095),Vector2(1266,772),1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(10),"timeout")
	tween.interpolate_property(margin,"position",Vector2(1266,772),Vector2(1266,1095),1,Tween.TRANS_BACK,Tween.EASE_IN)
	tween.start()
	yield(get_tree().create_timer(1.1),"timeout")
	queue_free()
	
