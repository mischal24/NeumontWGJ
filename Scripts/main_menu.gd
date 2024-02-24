extends Control

func _on_button_pressed():
	$Label.hide()
	$Button.hide()
	await get_tree().create_timer(0.6).timeout
	get_tree().change_scene_to_file("res://Scenes/test_scene.tscn")
