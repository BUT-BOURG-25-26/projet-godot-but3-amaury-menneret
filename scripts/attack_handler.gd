class_name AttackHandler
extends Node

@onready var attack : PackedScene
@onready var cooldown : Timer
@onready var source : Player

func _ready() -> void:
	cooldown = Timer.new()
	if attack != null && cooldown != null:
		cooldown.wait_time =  (attack.instantiate() as ProjectileAttack).cooldown
		print((attack.instantiate() as ProjectileAttack).cooldown)
	cooldown.autostart = true
	await cooldown.timeout.connect(_on_cooldown_timeout)
	add_child(cooldown)

func _on_cooldown_timeout() -> void:
	print("COOLDOWN DONE ", (attack.instantiate() as ProjectileAttack).attack_name)
	if(source.enemies_in_range.size() > 0):
		var scene = attack.instantiate()
		scene.global_position = source.global_position
		scene.target = source.enemies_in_range.pick_random()
		get_tree().get_current_scene().add_child(scene)
