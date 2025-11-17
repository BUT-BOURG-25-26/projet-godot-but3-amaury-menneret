extends CanvasLayer

@onready var start_level: PackedScene = preload("res://scenes/main.tscn")

func _on_play_pressed() -> void:
	visible = false
	GameManager.paused(false)
	get_tree().change_scene_to_packed(start_level)

func _on_quit_pressed() -> void:
	GameManager.quit()
