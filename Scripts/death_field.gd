extends Area2D

var speed : float = 250.0

func _process(delta):
	position.x = lerp(position.x, position.x + (speed * delta), 0.1)

func _on_body_entered(body):
	if body is Player:
		body.queue_free()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	else: pass
