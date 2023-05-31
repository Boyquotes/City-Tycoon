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



func _on_buy_pressed():
	pass # Replace with function body.
