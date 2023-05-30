extends Camera2D



func _ready():
	ManagerGame.global_cam_ref = self
	
	set_limits()
	

func _unhandled_input(event):
	if event is InputEventScreenDrag:
		global_position += -event.relative


func set_limits():
	limit_bottom = $BR.global_position.y
	limit_right = $BR.global_position.x
	limit_left = $TL.global_position.x
	limit_top = $TL.global_position.y


func snap_to(g_pos: Vector2):
	var t = create_tween()
	t.tween_property(self, 'global_position', Vector2(g_pos.x + 164, g_pos.y), 0.2)
