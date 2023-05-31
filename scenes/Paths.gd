extends Node2D



func _on_car_spawn_timer_timeout():
	var c = get_children()
	c.shuffle()
	
	var car = c[0]
	car.get_node('PathFollow2D').progress_ratio = 0.0
	
	var t = create_tween()
	t.tween_property(car.get_node('PathFollow2D'), 'progress_ratio', 1.0, 13.0)
