extends Control


@onready var panel = $Panel



func _ready():
	panel.pivot_offset = panel.size / 2


func _on_gui_input(event):
	if event is InputEventScreenTouch and !event.pressed:
		hide()


func anim_panel():
	panel.scale = Vector2.ZERO
	var t = create_tween()
	t.tween_property(panel, 'scale', Vector2(1, 1), .3).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)


func load_shop(data: Dictionary):
	get_node('%Name').text = data['name']


func _on_visibility_changed():
	anim_panel()
