extends Panel


@export var item_name = 'Bag of gems'
@export var id = ''
@export var price = 1.0
@export var amount: int = 1


func _ready():
	$Icon.texture = load("res://assets/icons/%s.png" % id)
	$Price.text = '$' + str(price).replace('.', ',')
	$Name.text = item_name
	$Amount.text = 'x' + str(amount)


func _on_gui_input(event):
	pass # Replace with function body.
