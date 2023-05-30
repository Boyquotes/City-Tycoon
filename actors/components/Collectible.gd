extends Node2D



func set_icon(id: String):
	$Sprite2D.texture = load("res://reso/data/floater_icons/%s.tres" % id)

#func _unhandled_input(event):
#	if event is InputEventScreenTouch and !event.pressed and $Sprite2D.get_rect().has_point(to_local(event.position)):
#		activate(false)


#func activate(b: bool = true):
#	if b:
#		show()
#	else:
#		hide()


#func collect():
#	pass
