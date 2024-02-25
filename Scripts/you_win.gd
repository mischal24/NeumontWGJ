extends Control

func _ready():
	GlobalTimer.timer_is_on = false

func _on_button_pressed():
	GlobalTimer.reset_timer()
	$AudioStreamPlayer2D.stream = load("res://Sounds/startup.wav")
	$AudioStreamPlayer2D.play()
	Music.stop()
	await get_tree().create_timer(0.1).timeout
	GlobalTimer.hide()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
