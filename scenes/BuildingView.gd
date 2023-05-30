extends Control


@onready var panel = $Panel
@onready var exp_bar = get_node('%EXPBar')
@onready var exp_label = get_node('%EXPLabel')
@onready var bi = $Panel/VBoxContainer/VBoxContainer/HBoxContainer/BI
@onready var eb = $Panel/VBoxContainer/VBoxContainer/HBoxContainer2/EB
@onready var m = $Panel/VBoxContainer/VBoxContainer/HBoxContainer3/M

var current_data


func _ready():
	ManagerGame.gold_changed.connect(on_gold_changed)
	
	panel.pivot_offset = panel.size / 2


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		hide()


func anim_panel():
	panel.scale = Vector2.ZERO
	var t = create_tween()
	t.tween_property(panel, 'scale', Vector2(1, 1), .3).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)


func load_shop(data = null):
	if data == null:
		return
	
	if data['is_unlocked'] == false:
		get_node('%Name').text = data['name'] + '(Locked)'
		$Panel/VBoxContainer/VBoxContainer.hide()
		return
	else:
		$Panel/VBoxContainer/VBoxContainer.show()
	
	current_data = data
	
	get_node('%Name').text = data['name']
	get_node('%Level').text = 'Level ' + str(data['level'])
	
	exp_bar.value = current_data['exp']
	exp_bar.max_value = current_data['exp_max']
	exp_label.text = str(current_data['exp']) + '/' + str(current_data['exp_max'])
	
	bi.text = ManagerGame.int_to_currency(data['upgrades']['improve'])
	eb.text = ManagerGame.int_to_currency(data['upgrades']['staff'])
	m.text = ManagerGame.int_to_currency(data['upgrades']['efficiency'])
	
	on_gold_changed()


func level_up_shop():
	current_data['level'] += 1
	current_data['exp'] += 1
	current_data['profits'] *= 1.1
	
	if current_data['exp'] >= current_data['exp_max']:
		current_data['exp'] = 0
		current_data['exp_max'] += 10
	
	
	
	load_shop(current_data)


func on_gold_changed():
	if current_data == null:
		return
	
	var gold = ManagerGame.player_data['gold']
	
	if current_data['upgrades']['improve'] > gold:
		bi.disabled = true
	else:
		bi.disabled = false
	if current_data['upgrades']['staff'] > gold:
		eb.disabled = true
	else:
		eb.disabled = false
	if current_data['upgrades']['efficiency'] > gold:
		m.disabled = true
	else:
		m.disabled = false


func _on_visibility_changed():
	anim_panel()
	
	if visible == false:
		current_data = null


func _on_bi_pressed():
	ManagerGame.player_data['gold'] -= current_data['upgrades']['improve']
	ManagerGame.gold_changed.emit()
	
	current_data['upgrades']['improve'] *= current_data['base_upgrades_increment']
	level_up_shop()


func _on_eb_pressed():
	ManagerGame.player_data['gold'] -= current_data['upgrades']['staff']
	ManagerGame.gold_changed.emit()
	
	current_data['upgrades']['staff'] *= current_data['base_upgrades_increment']
	level_up_shop()


func _on_m_pressed():
	ManagerGame.player_data['gold'] -= current_data['upgrades']['efficiency']
	ManagerGame.gold_changed.emit()
	
	current_data['upgrades']['efficiency'] *= current_data['base_upgrades_increment']
	level_up_shop()
