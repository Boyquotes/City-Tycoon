extends Control



func _ready():
	ManagerGame.global_ui_ref = self


func show_building(data: Dictionary):
	$BuildingView.load_shop(data)
	$BuildingView.show()


func _on_card_pressed(extra_arg_0):
	$MainPanel.show()
