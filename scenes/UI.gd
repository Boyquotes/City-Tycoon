extends Control


@onready var pop_ups = $Popups
@onready var main_panel = $MainPanel


func _ready():
	ManagerGame.global_ui_ref = self


func show_building(data: Dictionary):
	$BuildingView.load_shop(data)
	$BuildingView.show()


func pop_ui(scene):
	pop_ups.add_child(scene)


func refresh_cards():
	main_panel.load_cards()


func _on_card_pressed(idx):
	main_panel.tab.current_tab = idx
	main_panel.show()
	
	main_panel.load_ads_buttons()
