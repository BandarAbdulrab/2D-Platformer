extends Area2D

@export var target_level : PackedScene
@export var required_points: int = 14

@onready var game_manager: Node = %GameManager


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		if game_manager.points >= required_points:
			if target_level != null:
				get_tree().call_deferred("change_scene_to_packed", target_level)
		else:
			print("Need ", required_points, " points! You only have: ", game_manager.points)
