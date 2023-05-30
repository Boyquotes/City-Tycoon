extends Node2D


func _on_collection_timer_timeout():
	for shop in ManagerGame.global_shops_ref:
		shop.collect()
