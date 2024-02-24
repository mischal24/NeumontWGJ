extends CanvasLayer

func _ready():
	$Control/AnimationPlayer.play("Start")
	await $Control/AnimationPlayer.animation_finished
	queue_free()
