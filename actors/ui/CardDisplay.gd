@tool
extends Panel


@export var id = ''

var data = {}


func _ready():
	load_card(id)


func load_card(id):
	data = ManagerGame.player_data['cards'][id]
	
	if data['is_unlocked']:
		$Icon.modulate = Color.WHITE
		$Name.modulate = Color.WHITE
	else:
		$Icon.modulate = Color.BLACK
		$Name.modulate = Color.BLACK
	
#	$Icon.texture = load("res://assets/icons/cards/%s.png" % id)
	$Name.text = ManagerGame.player_data['cards'][id]['name']
