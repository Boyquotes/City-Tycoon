extends Area2D

@onready var shape: CollisionShape2D = get_node('CollisionShape2D')



func _ready():
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and !event.pressed:
		pass
