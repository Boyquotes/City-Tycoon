extends Control



func _ready():
	ManagerGame.global_ui_ref = self


func show_building(data: Dictionary):
	$BuildingView.load_shop(data)
	$BuildingView.show()


func _on_card_pressed(idx):
	$MainPanel.tab.current_tab = idx
	$MainPanel.show()
