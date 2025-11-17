extends Control

func _ready() -> void:
	visible = false

func _on_restart_pressed() -> void:
	GameManager.restart()

func _on_exit_pressed() -> void:
	GameManager.quit()
