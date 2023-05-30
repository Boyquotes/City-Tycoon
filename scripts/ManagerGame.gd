extends Node

# bakery
# ice cream
# clothes
# meat shop
# gym
# music
# costume

#var shop_base = {
#	'name': 'Bakery',
#	'id': 'shop_bakery',
#	'level': 1,
#	'exp': 0,
#	'exp_max': 10,
#	'base_upgrades_increment': 1.5,
#	'upgrades': {
#		'improve': 0,
#		'staff': 0,
#		'efficiency': 0
#	},
#	'is_unlocked': false,
#}


var save_path = 'user://player_data.json'

var player_data = {
	'shops_data': {}
}


var global_world_ref
var global_ui_ref
var global_cam_ref



func _ready():
	if FileAccess.file_exists(save_path):
		load_game()
	else:
		var f = FileAccess.open("res://reso/data/shops.json", FileAccess.READ)
		var j = JSON.new()
		j.parse(f.get_as_text())
		print(j.data)
		player_data['shops_data'] = j.data


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_game()


func save_game():
	var f = FileAccess.open(save_path, FileAccess.WRITE)
	f.store_string(JSON.stringify(player_data))
	f.close()


func load_game():
	var f = FileAccess.open(save_path, FileAccess.READ)
	var json = JSON.new()
	json.parse(f.get_as_text())
	player_data = json.data
	f.close()


func int_to_currency(amount):
	var s = ['K', 'M', 'B', 'T', 'Q']
	var suffix = s[floor((str(amount).length() / 3)) - 1]
	var st = str(amount)
	
	if st.length() >= 4:
		var ns = ''
		var ro = st.length() / 3
		
		for i in range(ro):
			ns += st[i]
		
		st = ns
		st += suffix
	
	return st


