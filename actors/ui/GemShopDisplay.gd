extends Panel


@export var item_name = 'Bag of gems'
@export var id = ''
@export var price = 1.0


func _ready():
	$Icon.texture = load("res://assets/icons/%s.png" % id)
	$Price.text = '$' + str(price).replace('.', ',')
	$Name.text = item_name
