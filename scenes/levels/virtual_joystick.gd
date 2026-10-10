class_name MobileJoystick
extends Control

@export var max_distance: float = 64.0

@onready var base: Sprite2D = $Base
@onready var tip: Sprite2D = $Tip

var output_vector: Vector2 = Vector2.ZERO
var touch_index: int = -1

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and touch_index == -1:
			var touch_dist = (event.position - base.global_position).length()
			# Activate when touching within the joystick base area
			if touch_dist <= max_distance * 1.5:
				touch_index = event.index
				_update_joystick(event.position)
		elif not event.pressed and event.index == touch_index:
			_reset_joystick()

	elif event is InputEventScreenDrag and event.index == touch_index:
		_update_joystick(event.position)

func _update_joystick(global_touch_pos: Vector2) -> void:
	var offset: Vector2 = global_touch_pos - base.global_position
	var clamped_offset: Vector2 = offset.limit_length(max_distance)
	
	tip.global_position = base.global_position + clamped_offset
	output_vector = clamped_offset / max_distance

func _reset_joystick() -> void:
	touch_index = -1
	tip.global_position = base.global_position
	output_vector = Vector2.ZERO
