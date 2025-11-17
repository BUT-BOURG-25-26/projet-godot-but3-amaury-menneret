extends Control

func _ready() -> void:
	set_visible(GameManager.pause)

func _on_continue_pressed() -> void:
	GameManager.display_pause_menu(false)

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	GameManager.quit()
