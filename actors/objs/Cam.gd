extends Camera2D




func _unhandled_input(event):
	if event is InputEventScreenDrag:
		global_position += -event.relative
