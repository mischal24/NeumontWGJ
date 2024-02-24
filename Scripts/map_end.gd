extends Area2D

@onready var scene = get_tree().current_scene

@export var next_scene : PackedScene

func _on_body_entered(body):
	if body is Player:
		for i in scene.get_children():
			i.call_deferred("queue_free")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_packed(next_scene)
	else: pass
