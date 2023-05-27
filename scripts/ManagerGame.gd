extends Node

# bakery
# ice cream
# clothes
# meat shop
# gym
# music
# costume

var shop_base = {
	'name': 'Bakery',
	'id': 'shop_bakery',
	'level': 1,
	'exp': 0,
	'exp_max': 10,
	'base_upgrades_increment': 1.5,
	'upgrades': {
		'improve': 0,
		'staff': 0,
		'efficiency': 0
	},
	'is_unlocked': false,
}


var save_path = 'user://player_data.json'

var player_data = {
	'shops_data': {}
}


var global_world_ref
var global_ui_ref



func _ready():
	if FileAccess.file_exists(save_path):
		load_game()
	else:
		var f = FileAccess.open("res://reso/data/shops.json", FileAccess.READ)
		var j = JSON.new()
		j.parse(f.get_as_text())
		player_data['shops_data'] = j.data


func save_game():
	var f = FileAccess.open(save_path, FileAccess.WRITE)
	f.store_string(JSON.parse_string(player_data))
	f.close()


func load_game():
	var f = FileAccess.open(save_path, FileAccess.READ)
	var json = JSON.new()
	json.parse(f.get_as_text())
	player_data = json.data
	f.close()




