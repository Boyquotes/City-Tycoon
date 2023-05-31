@tool
extends Panel


@export var id = ''

var data = {}


func _ready():
	load_card(id)


func load_card(id):
	$Icon.texture = load("res://assets/icons/cards/%s.png" % id)
	$Name.text = ManagerGame.player_data['cards'][id]['name']
