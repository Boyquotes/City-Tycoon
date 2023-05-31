extends Control


# percentages

var gold_perc
var rare_perc
var common_perc


func _ready():
	$CanvasLayer/WinControl.pivot_offset = $CanvasLayer/WinControl.size / 2


func display(price: int, id: String, perc_arr: Array):
	$Panel/VBoxContainer/Buy.text = 'Buy ' + str(price)
	
	gold_perc = perc_arr[0]
	rare_perc = perc_arr[1]
	common_perc = perc_arr[2]
	
	$Panel/VBoxContainer/GoldPerc.text = '%' + str(gold_perc) + ' Gold Card'
	$Panel/VBoxContainer/RarePerc.text = '%' + str(rare_perc) + ' Rare Card'
	$Panel/VBoxContainer/CommonPerc.text = '%' + str(common_perc) + ' Common Card'
	
	if ManagerGame.player_data['gems'] >= price:
		$Panel/VBoxContainer/Buy.disabled = false
	else:
		$Panel/VBoxContainer/Buy.disabled = true
	
	match id:
		'lucky': pass
		'clover': pass
		'normal': pass


func roll():
	var gold_cards = []
	var rare_cards = []
	var common_cards = []
	
	for card in ManagerGame.player_data['cards']:
		if ManagerGame.player_data['cards'][card]['rarity'] == 'gold':
			gold_cards.append(card)
		if ManagerGame.player_data['cards'][card]['rarity'] == 'rare':
			rare_cards.append(card)
		if ManagerGame.player_data['cards'][card]['rarity'] == 'common':
			common_cards.append(card)
	
	var test_dict = {}
	
	for i in range(10):
		randomize()
		var rand = randi_range(1, 100)
		
		var id = ''
		
		if rand <= gold_perc:
			gold_cards.shuffle()
			id = gold_cards[0]
		elif rand > gold_perc and rand <= rare_perc:
			rare_cards.shuffle()
			id = rare_cards[0]
		else:
			common_cards.shuffle()
			id = common_cards[0]
		
		if test_dict.has(id):
			test_dict[id]['amount'] += 1
		else:
			test_dict[id] = {
				'amount': 1
			}
	
	for w in test_dict:
		var data = ManagerGame.player_data['cards'][w]
		
		var panel_texture
		
		match data['rarity']:
			'gold': panel_texture = load("res://reso/styles/panel_gold_white_outine.tres")
			'rare': panel_texture = load("res://reso/styles/panel_purple_white_outine.tres")
			'common': panel_texture = load("res://reso/styles/panel_blue_white_outine.tres")
		
		var d = load("res://actors/ui/popups/CardDrawDisplay.tscn").instantiate()
		d.set('theme_override_styles/panel', panel_texture)
		d.get_node('Amount').text = 'x' + str(test_dict[w]['amount'])
		d.get_node('Icon').texture = load("res://assets/icons/cards/%s.png" % w)
		$CanvasLayer/WinControl/WinPanel/ScrollContainer/GridContainer.add_child(d)
		
		ManagerGame.player_data['cards'][w]['is_unlocked'] = true
		
		ManagerGame.player_data['cards'][w]['exp'] += test_dict[w]['amount']
		
		while ManagerGame.player_data['cards'][w]['exp'] >= ManagerGame.player_data['cards'][w]['exp_max']:
			ManagerGame.player_data['cards'][w]['exp'] = ManagerGame.player_data['cards'][w]['exp'] - ManagerGame.player_data['cards'][w]['exp_max']
			ManagerGame.player_data['cards'][w]['exp_max'] += 10
			
			ManagerGame.player_data['cards'][w]['income_add'] *= 1.5
	
	ManagerGame.global_ui_ref.refresh_cards()
	
	$CanvasLayer/WinControl.scale = Vector2.ZERO
	$CanvasLayer/WinControl.show()
	var t = create_tween()
	t.tween_property($CanvasLayer/WinControl, 'scale', Vector2.ONE, .2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		queue_free()


func _on_buy_pressed():
	roll()


func _on_win_control_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		for child in $CanvasLayer/WinControl/WinPanel/ScrollContainer/GridContainer.get_children():
			child.queue_free()
		
		$CanvasLayer/WinControl.hide()
