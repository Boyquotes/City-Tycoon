extends Control


@onready var pop_ups = $Popups


func _ready():
	ManagerGame.global_ui_ref = self


func show_building(data: Dictionary):
	$BuildingView.load_shop(data)
	$BuildingView.show()


func pop_ui(scene):
	pop_ups.add_child(scene)


func _on_card_pressed(idx):
	$MainPanel.tab.current_tab = idx
	$MainPanel.show()
