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
	pass
