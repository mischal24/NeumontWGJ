extends CharacterBody2D
class_name Player

# Movement variables
var speed : float = 400.0
var time_to_start : float

var flipped : bool = false

# Jump variables
var jump_height : float = 180.0
var time_to_peak : float = 0.35
var time_to_fall : float = 0.32

@onready var jump_vel : float = ((2.0 * jump_height) / time_to_peak) * -1
@onready var jump_gr : float = ((-2.0 * jump_height) / (time_to_peak * time_to_peak)) * -1
@onready var fall_gr : float = ((-2.0 * jump_height) / (time_to_fall * time_to_fall)) * -1

var coyote_time : float = 0.25
var can_jump : bool = false

var remember_time : float = 0.011

# SFX variables
var jump_sfx = load("res://Sounds/jump.wav")
var step_sfx = load("res://Sounds/step.wav")

func direction() -> float:
	return Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left")

func gravity() -> float:
	return jump_gr if velocity.y < 0.0 else fall_gr

func jump():
	$AnimationPlayer.play("Jump")
	if $AudioStreamPlayer2D.stream != jump_sfx:
		$AudioStreamPlayer2D.stream = jump_sfx
	if not $AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.play()
	velocity.y = jump_vel

func flip():
	flipped = not flipped
	$Sprite2D.flip_h = not $Sprite2D.flip_h

func _ready():
	time_to_start = 0.7

func _physics_process(delta):
	# Gravity
	velocity.y += gravity() * delta

	# Movement
	if time_to_start > 0:
		time_to_start -= 1 * delta
		velocity.x += speed * delta
	else:
		velocity.x = lerp(velocity.x, direction() * speed, 0.1)

		if velocity.x < 0 and not flipped: flip()
		if velocity.x > 0 and flipped: flip()

		if is_on_floor():
			if abs(velocity.x) > 100:
				$AnimationPlayer.play("Run")
				if !$AudioStreamPlayer2D.playing:
					$AudioStreamPlayer2D.stream = step_sfx
					$AudioStreamPlayer2D.play()
			elif $AudioStreamPlayer2D.playing:
				$AudioStreamPlayer2D.stop()
			else:
				$AnimationPlayer.play("Idle")

		# Jump
		if is_on_floor() and not can_jump:
			can_jump = true
		elif can_jump and $CoyoteTimer.is_stopped():
			$CoyoteTimer.start(coyote_time)

		if Input.is_action_just_pressed("Jump") and can_jump:
			jump()

	move_and_slide()

func _on_coyote_timer_timeout():
	can_jump = false
