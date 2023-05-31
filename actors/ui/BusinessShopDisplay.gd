extends Panel

var shop_id = ''


func _ready():
	$Icon.texture = load("res://reso/data/floater_icons/%s.tres" % shop_id)
	$HBoxContainer/VBoxContainer/Name.text = ManagerGame.player_data['shops_data'][shop_id]['name']
	$HBoxContainer/Buy.text = 'Buy ' + ManagerGame.int_to_currency(ManagerGame.player_data['shops_data'][shop_id]['price'])
	
	var price = ManagerGame.player_data['shops_data'][shop_id]['price']
	
	if ManagerGame.player_data['gold'] < price:
		$HBoxContainer/Buy.disabled = true
	else:
		$HBoxContainer/Buy.disabled = false
	
	if ManagerGame.player_data['shops_data'][shop_id]['is_unlocked']:
		$HBoxContainer/Buy.text = 'Unlocked'
		$HBoxContainer/Buy.disabled = true


func _on_buy_pressed():
	ManagerGame.player_data['shops_data'][shop_id]['is_unlocked'] = true
	ManagerGame.shop_unlocked.emit(shop_id)
