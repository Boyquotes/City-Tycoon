extends Control


@onready var panel = $Panel
@onready var exp_bar = get_node('%EXPBar')
@onready var exp_label = get_node('%EXPLabel')

var current_data


func _ready():
	panel.pivot_offset = panel.size / 2


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		hide()


func anim_panel():
	panel.scale = Vector2.ZERO
	var t = create_tween()
	t.tween_property(panel, 'scale', Vector2(1, 1), .3).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)


func load_shop(data: Dictionary):
	current_data = data
	
	get_node('%Name').text = data['name']
	get_node('%Level').text = 'Level ' + str(data['level'])
	
	exp_bar.value = current_data['exp']
	exp_bar.max_value = current_data['exp_max']
	exp_label.text = str(current_data['exp']) + '/' + str(current_data['exp_max'])


func level_up_shop():
	current_data['level'] += 1
	current_data['exp'] += 1
	current_data['profits'] *= current_data['base_upgrades_increment']
	
	if current_data['exp'] >= current_data['exp_max']:
		current_data['exp'] = 0
		current_data['exp_max'] += 10
	
	load_shop(current_data)


func _on_visibility_changed():
	anim_panel()


func _on_bi_pressed():
	current_data['upgrades']['improve'] *= current_data['base_upgrades_increment']
	level_up_shop()


func _on_eb_pressed():
	level_up_shop()


func _on_m_pressed():
	level_up_shop()
