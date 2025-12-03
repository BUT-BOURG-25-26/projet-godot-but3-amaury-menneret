class_name MagicArrowSkill

extends Skill

@export var magic_arrow_scene : PackedScene
@export var count : int
	
func cast(source : LivingEntity, target : LivingEntity) -> void:
	for x in count:
		summon_magic_arrow(source.position, (source.position - (target.position + Vector3(randf_range(-1,1),randf_range(-1,1),randf_range(-1,1)))).normalized())

func summon_magic_arrow(source : Vector3, direction : Vector3) -> void:
	var instance = magic_arrow_scene.instantiate() as MagicArrow
	instance.position = source
	instance.rotation = direction
	get_tree().current_scene.add_child(instance)

func cast_requirements(source : LivingEntity) -> bool :
	if source is Player:
		return source.use_mana(mana_cost)
	return false

func cast_effects() -> void :
	pass
