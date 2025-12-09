class_name MagicArrowSkill

extends Skill

@export var magic_arrow_scene : PackedScene
@export var count : int
func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void:
	var wait_time : float = (cooldown/2)/count
	var directions : Array[Vector3] = []
	for target in targets :
		directions.append(( target.position - source.position).normalized())
	for x in count:
		summon_magic_arrow(source.position, directions.pick_random())
		await get_tree().create_timer(wait_time).timeout

func summon_magic_arrow(source : Vector3, direction : Vector3) -> void:
	var instance = magic_arrow_scene.instantiate() as MagicArrow
	instance.position = source
	instance.direction = direction
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
