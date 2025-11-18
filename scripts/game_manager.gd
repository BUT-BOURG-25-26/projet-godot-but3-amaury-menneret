extends Node

var pause : bool = true
@onready var enemySpawner : EnemySpawner
@onready var killcount : int

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
	if display:
		Engine.time_scale = 0

func paused(state: bool):
	pause = state
	var pause_menu = get_tree().get_first_node_in_group("pause")
	if(pause_menu):
		pause_menu.visible = state
	if pause:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1

func restart():
	get_tree().reload_current_scene()
	paused(false)

func quit():
	get_tree().quit()
