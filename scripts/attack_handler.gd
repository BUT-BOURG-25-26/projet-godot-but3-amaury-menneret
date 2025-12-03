class_name AttackHandler

extends Node

@onready var attack : PackedScene
@onready var cooldown : Timer
@onready var source : Player
#
#func _ready() -> void:
	#cooldown = Timer.new()
	#if attack != null && cooldown != null:
		#cooldown.wait_time =  (attack.instantiate() as ProjectileAttack).cooldown
	#cooldown.autostart = true
	#await cooldown.timeout.connect(_on_cooldown_timeout)
	#add_child(cooldown)
#
#func _on_cooldown_timeout() -> void:
	#if(source.enemies_in_range.size() > 0 && source.use_mana(attack.instantiate().mana_cost)):
		#var scene = attack.instantiate()
		#scene.transform = source.global_transform
		#scene.target = source.enemies_in_range.keys().pick_random()
		#get_tree().get_current_scene().add_child(scene)
		#source.mana 
