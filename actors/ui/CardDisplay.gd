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
		$EXP.show()
		
		ManagerGame.player_data['income_mult'] *= data['income_add']
	else:
		$Icon.modulate = Color.BLACK
		$Name.modulate = Color.BLACK
		$EXP.hide()
	
	$Icon.texture = load("res://assets/icons/cards/%s.png" % id)
	$Name.text = ManagerGame.player_data['cards'][id]['name']


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed and data['is_unlocked']:
		var card_view = load("res://actors/ui/popups/CardView.tscn").instantiate()
		card_view.display(data, id)
		ManagerGame.global_ui_ref.pop_ui(card_view)
