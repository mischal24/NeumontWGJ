extends CanvasLayer

var current_scene

var time : float = 301
var timer_is_on : bool = true

func _ready():
	if current_scene == null:
		timer_is_on = false
		hide()
	else: pass

func _process(delta):
	if timer_is_on:
		time -= 1 * delta

		var secs : float = fmod(time, 60)
		var mins : float = fmod(time, 60*60) / 60

		$Control/Label.text = "%0d:%02d" % [mins,secs]
		
		if time <= 1:
			timer_is_on = false
			play_death()
			await get_tree().create_timer(1).timeout
			for i in current_scene.get_children():
				i.call_deferred("queue_free")
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func set_timer(scene):
	current_scene = scene
	timer_is_on = true
	show()

func reset_timer():
	time = 301

func play_death():
	$Control/AnimationPlayer.play("Fade")
