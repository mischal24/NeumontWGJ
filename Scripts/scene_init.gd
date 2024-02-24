extends Node

func _ready():
	GlobalTimer.set_timer(get_tree().current_scene)
