extends Control

func _ready():
	GlobalTimer.timer_is_on = false

func _on_button_pressed():
	GlobalTimer.reset_timer()
	GlobalTimer.timer_is_on = true
	get_tree().change_scene_to_file("res://Scenes/test_scene.tscn")
