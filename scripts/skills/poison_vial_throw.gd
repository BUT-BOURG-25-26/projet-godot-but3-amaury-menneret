class_name PoisonVialThrowSkill

extends Skill

@export var poison_vial_scene : PackedScene
@export var throw_distance : float
@export var count : int
@export var duration : float

@export var zone_radius : float

func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void:
	var wait_time : float = (cooldown/2)/count
	var directions : Array[Vector3] = []
	for target in targets :
		directions.append(( target.position - source.position).normalized())
	for x in count:
		throw_poison_vial(source.position, directions.pick_random())
		await get_tree().create_timer(wait_time).timeout

func throw_poison_vial(source : Vector3, direction : Vector3) -> void:
	var instance = poison_vial_scene.instantiate() as PoisonVial
	instance.position = source + (direction * throw_distance)
	instance.ttl = duration
	instance.zone_radius = zone_radius
	get_tree().current_scene.add_child(instance)

func cast_requirements(source : LivingEntity, targets : Array[LivingEntity]) -> bool :
	if targets.size() > 0:
		if source is Player:
			return true
		if source is Hostile:
			return (source as Hostile).can_attack
	return false

func cast_effects(source : LivingEntity) -> void :
	pass
