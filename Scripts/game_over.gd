extends Control

func _ready():
	GlobalTimer.timer_is_on = false

func _on_button_pressed():
	GlobalTimer.reset_timer()
	GlobalTimer.timer_is_on = true
	$AudioStreamPlayer2D.stream = load("res://Sounds/startup.wav")
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/scene.tscn")
