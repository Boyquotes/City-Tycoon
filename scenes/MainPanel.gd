extends Panel

@onready var tab = $TabContainer
@onready var business_list = get_node('%BusinessList')
@onready var gold_card_list = get_node('%Gold').get_node('HBoxContainer')
@onready var rare_card_list = get_node('%Rare').get_node('HBoxContainer')
@onready var common_card_list = get_node('%Common').get_node('HBoxContainer')
@onready var get_gold_ad = get_node('%GetGold')
@onready var get_gem_ad = get_node('%GetGem')


func _ready():
	ManagerGame.shop_unlocked.connect(on_shop_unlocked)
	
	MobileAds.rewarded_ad_loaded.connect(on_rewarded_ad_loaded)
	MobileAds.user_earned_rewarded.connect(on_user_earned_rewarded)
	
	load_businesses()
	load_cards()
	load_ads_buttons()


func open_tab(idx: int):
	pass


func load_businesses():
	for child in business_list.get_children():
		child.queue_free()
	
	for b in ManagerGame.player_data['shops_data']:
		var d = load("res://actors/ui/BusinessShopDisplay.tscn").instantiate()
		d.shop_id = b
		
		business_list.add_child(d)


func load_ads_buttons():
	var g = ManagerGame.player_data['gold'] * .3
	
	get_gold_ad.text = 'Get +%s' % ManagerGame.int_to_currency(g)


func clear_cards():
	# since income mult is only affected by cards
	# we can just do this shit here or else, we would keep
	# accumulating income_mult everytime we reload/re-instance CardDisplay.tscn
	ManagerGame.player_data['income_mult'] = 1.0
	
	for child in gold_card_list.get_children():
		child.queue_free()
	for child in rare_card_list.get_children():
		child.queue_free()
	for child in common_card_list.get_children():
		child.queue_free()


func load_cards():
	clear_cards()
	
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


func on_rewarded_ad_loaded():
	MobileAds.show_rewarded()


func on_user_earned_rewarded(currency, amount):
	pass


func _on_close_pressed():
	hide()


func _on_get_gold_pressed():
	MobileAds.load_rewarded()


func _on_get_gem_pressed():
	MobileAds.load_rewarded()
