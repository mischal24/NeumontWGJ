extends Area2D

@onready var scene = get_tree().current_scene

@export var next_scene : PackedScene

func _on_body_entered(body):
	if body is Player:
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_packed(next_scene)
	else: pass
