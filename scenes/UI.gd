extends Control



func _ready():
	ManagerGame.global_ui_ref = self


func show_building():
	$BuildingView.show()
