extends CharacterBody2D
class_name Player

var speed : float = 400.0

# Jump variables
var jump_height : float = 160.0
var time_to_peak : float = 0.35
var time_to_fall : float = 0.32

@onready var jump_vel : float = ((2.0 * jump_height) / time_to_peak) * -1
@onready var jump_gr : float = ((-2.0 * jump_height) / (time_to_peak * time_to_peak)) * -1
@onready var fall_gr : float = ((-2.0 * jump_height) / (time_to_fall * time_to_fall)) * -1

func direction() -> float:
	return Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left")

func gravity() -> float:
	return jump_gr if velocity.y < 0.0 else fall_gr

func jump():
	velocity.y = jump_vel

func _physics_process(delta):
	# Movement
	velocity.x = lerp(velocity.x, direction() * speed, 0.1)

	# Gravity
	velocity.y += gravity() * delta

	# Jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		jump()

	move_and_slide()

func _ready():
	# Move right for a few seconds
	pass
