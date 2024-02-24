extends CanvasLayer

var current_scene

var time : float
var timer_is_on : bool = true

func _ready():
	if current_scene == null:
		timer_is_on = false
		hide()
	else: pass

func _process(delta):
	if timer_is_on:
		time += 1 * delta

		var secs : float = fmod(time, 60)
		var mins : float = fmod(time, 60*60) / 60

		$Control/Label.text = "%0d:%02d" % [mins,secs]
		
		if mins >= 1:
			for i in current_scene.get_children():
				i.call_deferred("queue_free")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func set_timer(scene):
	current_scene = scene
	timer_is_on = true
	show()

func reset_timer():
	time = 0
