extends Camera2D

@onready var player = get_tree().current_scene.get_node("Player")

func _process(_delta):
	if player != null:
		position = lerp(position, (get_tree().current_scene.get_node("Player").position)/100 , 0.1)
	else: pass
