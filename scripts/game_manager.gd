extends Node

@onready var pause : bool
@onready var enemySpawner : EnemySpawner

func _ready() -> void:
	paused(false)
	display_game_over(false)

func onPlayerLevelUp():
	if(enemySpawner != null):
		enemySpawner.increaseSpawnRate(1.2)

func display_game_over(display : bool):
	var game_over_menu = get_tree().get_first_node_in_group("game_over")
	if(game_over_menu):
		game_over_menu.visible = display
		paused(display)

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		display_pause_menu(!pause)

func display_pause_menu(state: bool):
	var pause_menu = get_tree().get_first_node_in_group("pause")
	if(pause_menu):
		pause_menu.visible = state
		paused(state)

func paused(state: bool):
	pause = state
	if pause:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1

func restart():
	get_tree().reload_current_scene()
	paused(false)

func quit():
	print("quit")
	get_tree().quit()
