extends Node2D

@export var id = 'shop_icecream'

var shop_data = null

func _ready():
	if ManagerGame.player_data['shops_data'].has(id):
		shop_data = ManagerGame.player_data['shops_data'][id]
	
	if ManagerGame.player_data['shops_data'][id]['is_unlocked']:
		var floater = load("res://actors/components/Collectible.tscn").instantiate()
		floater.set_icon(id)
		add_child(floater)
		floater.position.x += 56
		floater.position.y -= 32
	else:
		modulate = Color(.5,.5,.5,1)
	
	ManagerGame.global_shops_ref.append(self)


func collect():
	if shop_data['is_unlocked'] == false:
		return
	
	# the floater variable name here refers to the number that floats when the building
	# gets a profit or earns money. idk why i like to use 'floater' for things like this man honestly lmao
	var floater = load("res://actors/etc/NumberFloater.tscn").instantiate()
	floater.set_label(ManagerGame.int_to_currency(shop_data['profits']))
	floater.position.x += 56
	floater.position.y -= 32
	add_child(floater)
	
	ManagerGame.player_data['gold'] += shop_data['profits']
	ManagerGame.gold_changed.emit()
