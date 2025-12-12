class_name PoisonVial

extends Area3D

@export var poison_scene : PackedScene

@onready var poison_effect : Poison

@export var poison_damage : int
@export var poison_ticks : int
@export var poison_cooldown : float

@export var zone_cooldown : float

@onready var living_entities_in_range : Array[LivingEntity] = []

@onready var cooldown : Timer

func _ready() -> void:
	poison_effect = poison_scene.instantiate()
	poison_effect.damage = poison_damage
	poison_effect.ticks = poison_ticks
	poison_effect.cooldown = poison_cooldown
	cooldown = Timer.new()
	cooldown.wait_time = zone_cooldown
	cooldown.timeout.connect(poison_all_entities_in_range)
	add_child(cooldown)
	cooldown.start()

func get_first_effect_list_component(target : LivingEntity) -> EffectListComponent:
	for child in target.get_children():
		if child is EffectListComponent:
			return child
	return null

func _on_body_entered(body: Node3D) -> void:
	if body is LivingEntity and !living_entities_in_range.has(body):
		living_entities_in_range.append(body)

func _on_body_exited(body: Node3D) -> void:
	if body is LivingEntity and living_entities_in_range.has(body):
		living_entities_in_range.erase(body)

func poison_all_entities_in_range() -> void:
	for x in living_entities_in_range:
		poison_entity(x)

func poison_entity(entity : LivingEntity) -> void:
	var effect_list = get_first_effect_list_component(entity)
	if effect_list :
		effect_list.add_effect(poison_effect)
