extends Panel

@onready var tab = $TabContainer
@onready var business_list = get_node('%BusinessList')
@onready var gold_card_list = get_node('%Gold').get_node('HBoxContainer')
@onready var rare_card_list = get_node('%Rare').get_node('HBoxContainer')
@onready var common_card_list = get_node('%Common').get_node('HBoxContainer')


func _ready():
	ManagerGame.shop_unlocked.connect(on_shop_unlocked)
	
	load_businesses()
	load_cards()


func open_tab(idx: int):
	pass


func load_businesses():
	for child in business_list.get_children():
		child.queue_free()
	
	for b in ManagerGame.player_data['shops_data']:
		var d = load("res://actors/ui/BusinessShopDisplay.tscn").instantiate()
		d.shop_id = b
		
		business_list.add_child(d)


func load_cards():
	for card in ManagerGame.player_data['cards']:
		var rarity: String = ManagerGame.player_data['cards'][card]['rarity']
		var box
		
		match rarity:
			'gold': box = gold_card_list
			'rare': box = rare_card_list
			'common': box = common_card_list
		
		var display = load("res://actors/ui/CardDisplay.tscn").instantiate()
		display.id = card
		box.add_child(display)


func on_shop_unlocked(id):
	hide()


func _on_close_pressed():
	hide()
