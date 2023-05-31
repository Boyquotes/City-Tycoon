extends Panel


@export var item_name = 'Gold Cards'
@export var id = 'cards_gold'
@export var price: int = 100


func _ready():
	$Name.text = item_name
	$Price.text = str(price)
