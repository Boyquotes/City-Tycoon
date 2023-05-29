extends Camera2D



func _ready():
	ManagerGame.global_cam_ref = self


func _unhandled_input(event):
	if event is InputEventScreenDrag:
		global_position += -event.relative


func snap_to(g_pos: Vector2):
	var t = create_tween()
	t.tween_property(self, 'global_position', Vector2(g_pos.x + 164, g_pos.y), 0.2)
