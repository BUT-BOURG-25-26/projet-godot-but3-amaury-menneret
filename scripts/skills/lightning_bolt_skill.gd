class_name LightningBoltSkill

extends Skill

@export var lightning_bolt_scene : PackedScene
@export var count : int

func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void:
	var wait_time : float = (cooldown/2)/count
	for x in count:
		summon_lightning_bolt(targets.pick_random().position + Vector3(0,2,0))
		await get_tree().create_timer(wait_time).timeout

func summon_lightning_bolt(position : Vector3) -> void:
	print("SUMMONING LIGHTNING BOLT AT ", position)
	var instance = lightning_bolt_scene.instantiate() as LightningBolt
	instance.position = position
	get_tree().current_scene.add_child(instance)

func cast_requirements(source : LivingEntity, targets : Array[LivingEntity]) -> bool :
	if targets.size() > 0:
		if source is Player:
			return source.can_use_mana(mana_cost)
		if source is Hostile:
			return (source as Hostile).can_attack
	return false

func cast_effects(source : LivingEntity) -> void :
	if source is Player:
		source.use_mana(mana_cost)
