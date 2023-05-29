extends Area2D

@onready var shape: CollisionShape2D = get_node('CollisionShape2D')


func _ready():
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and !event.pressed:
		var id = get_parent().id
		var data = ManagerGame.player_data['shops_data'][id]
		
		ManagerGame.global_ui_ref.show_building(data)
		ManagerGame.global_cam_ref.snap_to(global_position)
