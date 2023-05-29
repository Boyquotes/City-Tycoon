extends Control


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		hide()
