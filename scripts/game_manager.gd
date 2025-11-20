extends Node

var pause : bool = true
@onready var enemySpawner : EnemySpawner
@onready var killcount : int
@onready var player : Player
#@onready var menu : UpgradeChoiceMenu = get_tree().get_first_node_in_group("upgrade_choice_menu")

func _ready() -> void:
	paused(false)
	display_game_over(false)
	
func give_player_upgrade(upgrade : PackedScene) :
	print("UPGRADE CHOSEN : ", (upgrade.instantiate() as ProjectileAttack).attack_name)
	player = get_tree().get_first_node_in_group("Player")
	player.gain_skill(upgrade)
	var upgrade_menu = get_tree().get_first_node_in_group("upgrade_choice_menu")
	upgrade_menu.visible = false
	for x in upgrade_menu.get_children():
		x.queue_free()
	(upgrade_menu as UpgradeChoiceMenu).choices.clear()
	Engine.time_scale = 1

func onPlayerLevelUp():
	if(enemySpawner != null):
		enemySpawner.increaseSpawnRate(1.2)
	#Engine.time_scale = 0
	#var upgrade_menu = load("res://scenes/menu/upgrade_choice_menu.tscn").instantiate()
	#v+ar ui_layer = get_tree().get_first_node_in_group("ui_layer")
	#ui_layer.add_child(upgrade_menu)
	#print((upgrade_menu as UpgradeChoiceMenu).choices)
	#var upgrade_menu : UpgradeChoiceMenu = get_tree().get_first_node_in_group("upgrade_choice_menu")
	#upgrade_menu.init()
	#upgrade_menu.visible = true
	#Engine.time_scale = 0

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
