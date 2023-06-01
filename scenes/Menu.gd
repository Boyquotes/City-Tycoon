extends Control


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		
		$"/root/LoadingScreen".load_scene("res://scenes/World.tscn")
#		get_tree().change_scene_to_file("res://scenes/World.tscn")


func _on_options_pressed():
	$CanvasLayer/OptionsPanel.show()
