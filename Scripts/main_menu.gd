extends Control

func _ready():
	$AudioStreamPlayer2D.stream = load("res://Sounds/hdd.wav")
	$AudioStreamPlayer2D.play()

func _process(_delta):
	$AnimationPlayer.play("Blink")

func _on_button_pressed():
	$Label.hide()
	$Button.hide()
	$AudioStreamPlayer2D2.stream = load("res://Sounds/startup.wav")
	$AudioStreamPlayer2D2.play()
	await get_tree().create_timer(0.6).timeout
	Music.start_music()
	get_tree().change_scene_to_file("res://Scenes/scene.tscn")
