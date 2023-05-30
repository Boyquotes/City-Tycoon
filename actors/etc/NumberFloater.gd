extends Node2D

@onready var label = $Label

func _ready():
	var t = create_tween().set_parallel()
	t.tween_property(self, 'modulate', Color.TRANSPARENT, 2.0)
	t.tween_property(self, 'global_position:y', global_position.y - 32, 1.5)
	
	await t.finished
	queue_free()


func set_label(s: String):
	$Label.text = '+' + s
