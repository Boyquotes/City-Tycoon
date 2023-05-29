extends Control


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		get_tree().change_scene_to_file("res://scenes/World.tscn")
