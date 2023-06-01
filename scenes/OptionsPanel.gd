extends Panel



func _ready():
	TranslationServer.set_locale(ManagerGame.player_data['settings']['lang'])


func _on_close_options_pressed():
	hide()


func _on_language_select_item_selected(index):
	if index == 0:
		TranslationServer.set_locale('en')
		ManagerGame.player_data['settings']['lang'] = 'en'
	else:
		TranslationServer.set_locale('de')
		ManagerGame.player_data['settings']['lang'] = 'de'
