extends Node2D

@export var store_name = 'Ice Cream Shop'
@export var id = 'shop_icecream'
@export var level: int = 1
@export var base_increment: float = 1.5



func _ready():
	if ManagerGame.player_data['shops_data'][id]['is_unlocked']:
		var floater = load("res://actors/components/Collectible.tscn").instantiate()
		floater.set_icon(id)
		add_child(floater)
		floater.position.x += 56
		floater.position.y -= 32
	else:
		modulate = Color(1,1,1,.5)
	
	
	
	
