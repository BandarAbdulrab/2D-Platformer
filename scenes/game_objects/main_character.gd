extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -750.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@export var joystick: Control

func jump():
	velocity.y = JUMP_VELOCITY

func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:
	if (velocity.x > 1 or velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Read keyboard input
	var direction := Input.get_axis("left", "right")

	# Read mobile virtual joystick if active
	if joystick and abs(joystick.output_vector.x) > 0.1:
		direction = joystick.output_vector.x

	# Apply horizontal movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 25)

	move_and_slide()

	var isLeft = velocity.x < 0 
	sprite_2d.flip_h = isLeft
