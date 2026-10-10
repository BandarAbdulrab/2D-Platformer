extends Node


func _on_button_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Level1.tscn")


func _on_button_2_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Level2.tscn")


func _on_button_3_quite_pressed() -> void:
	get_tree().quit()
