class_name PlayerStats

extends Control

@onready var player : Player = get_tree().get_first_node_in_group("Player")

@onready var label : Label = $Label
@onready var mana_bar : ProgressBar = $ManaBar
@onready var health_bar : ProgressBar = $HealthBar

func _ready() -> void:
	mana_bar.max_value = player.max_mana
	health_bar.max_value = player.max_health
	update()	

func update() ->  void:
	mana_bar.value = player.mana
	health_bar.value = player.health
	label.text = ("HP : " +str(player.health) + "/" + str(player.max_health) + "\nlevel : " + str(player.level as int) + "\nxp : " + str(player.xp) + "/" + str(player.xp_to_next_level) + "\nkill count : " + str(player.kill_count)) 
