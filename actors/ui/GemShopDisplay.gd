extends Panel


@export var id = ''
@export var price = 1.0


func _ready():
	$Icon.texture = load("res://assets/icons/%s.png" % id)
	$Price.text = '$' + str(price)
