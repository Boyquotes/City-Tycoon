extends Control


var thread
var tick = 0.0
var min_secs = 3.0

var path

func _ready():
	set_physics_process(false)
	
	hide()


func _physics_process(delta):
	if path == '':
		pass
	
	if ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_LOADED and tick >= min_secs:
		var scene = ResourceLoader.load_threaded_get(path)
		
		get_tree().root.add_child(scene.instantiate())
		
		hide()
	elif ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		$Progress.value = ResourceLoader.load_threaded_get_status(path, [1])
	
	tick += delta


func load_scene(scene_path):
	path = scene_path
	var e = ResourceLoader.load_threaded_request(path)
	
	if e == OK:
		set_physics_process(true)
	
	get_tree().root.get_children().back().queue_free()
	show()
