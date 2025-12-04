class_name MagicArrowSkill

extends Skill

@export var magic_arrow_scene : PackedScene
@export var count : int
	
func cast(source : LivingEntity, target : LivingEntity) -> void:
	for x in count:
		summon_magic_arrow(source.position + Vector3(x*0.1,0,0), ( target.position - source.position).normalized())

func summon_magic_arrow(source : Vector3, direction : Vector3) -> void:
	var instance = magic_arrow_scene.instantiate() as MagicArrow
	instance.position = source
	instance.direction = direction
	get_tree().current_scene.add_child(instance)

func cast_requirements(source : LivingEntity, target : LivingEntity) -> bool :
	if source is Player and target is Hostile:
		return source.use_mana(mana_cost)
	return false

func cast_effects() -> void :
	pass
