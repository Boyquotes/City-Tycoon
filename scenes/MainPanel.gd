extends Panel

@onready var tab = $TabContainer
@onready var business_list = get_node('%BusinessList')


func _ready():
	ManagerGame.shop_unlocked.connect(on_shop_unlocked)
	
	load_businesses()


func open_tab(idx: int):
	pass


func load_businesses():
	for child in business_list.get_children():
		child.queue_free()
	
	for b in ManagerGame.player_data['shops_data']:
		var d = load("res://actors/ui/BusinessShopDisplay.tscn").instantiate()
		d.shop_id = b
		
		business_list.add_child(d)


func on_shop_unlocked(id):
	hide()


func _on_close_pressed():
	hide()
