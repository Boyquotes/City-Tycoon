extends Control


var data




func display(d, id):
	data = d
	
	$Panel/VBoxContainer/Icon.texture = load("res://assets/icons/cards/%s.png" % id)
	$Panel/VBoxContainer/Name.text = data['name']
	$Panel/VBoxContainer/Profit.text = 'Increase income: +x%s' % str(data['income_add'])
