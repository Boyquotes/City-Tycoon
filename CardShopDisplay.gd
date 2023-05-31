extends Panel


@export var item_name = 'Gold Cards'
@export var id = 'cards_gold'
@export var price: int = 100
@export var gold_perc: float
@export var rare_perc: float
@export var normal_perc: float


func _ready():
	$Name.text = item_name
	$Price.text = str(price)


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		var perc_arr = [gold_perc, rare_perc, normal_perc]
		
		var cd = load("res://actors/ui/popups/CardDraw.tscn").instantiate()
		cd.display(price, id, perc_arr)
		ManagerGame.global_ui_ref.pop_ui(cd)
