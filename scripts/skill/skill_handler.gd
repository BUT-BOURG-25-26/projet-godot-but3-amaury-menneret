class_name SkillHandler

extends Node

@onready var skill : PackedScene
@onready var cooldown : Timer
@onready var source : LivingEntity

@onready var instance_of_skill : Skill

func _ready() -> void:
	if skill :
		instance_of_skill = skill.instantiate()
		cooldown = Timer.new()
		cooldown.wait_time = instance_of_skill.cooldown
		cooldown.timeout.connect(cooldown_done)
		add_child(cooldown)
		add_child(instance_of_skill)
		cooldown.start()

func cast(targets : Array[LivingEntity]) -> void:
	instance_of_skill.cast_effects(source)
	instance_of_skill.cast(source, targets)

func cooldown_done() -> void:
	var targets : Array[LivingEntity] = request_targets(instance_of_skill.max_target_nb)
	if instance_of_skill.cast_requirements(source, targets):
		cast(targets)

func request_target() -> LivingEntity:
	return source.get_target()
	
func request_targets(nb_targets : int) -> Array[LivingEntity]:
	var targets : Array[LivingEntity] = []
	for x in nb_targets :
		var target = request_target()
		if !targets.has(target):
			targets.append(target)
	if targets.has(source):
		targets.erase(source)
	return targets
