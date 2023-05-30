extends Panel


@onready var income = $HBoxContainer/Income
@onready var gold = $HBoxContainer/Gold
@onready var gems = $HBoxContainer/Gems


func _ready():
	ManagerGame.gold_changed.connect(on_gold_changed)
	
	on_gold_changed()


func on_gold_changed():
	gold.text = ManagerGame.int_to_currency(ManagerGame.player_data['gold'])
