extends AudioStreamPlayer

func start_music():
	stream = load("res://Sounds/music.wav")
	play()

func _on_finished():
	play()
