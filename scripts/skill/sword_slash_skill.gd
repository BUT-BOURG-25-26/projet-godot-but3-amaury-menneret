class_name SwordSlashSkill

extends Skill

@export var sword_slash_scene : PackedScene
@export var count : int

func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void:
	var wait_time : float = (cooldown/2)/count
	for x in count:
		slash_in_direction_of(source)
		await get_tree().create_timer(wait_time).timeout

func slash_in_direction_of(source : LivingEntity) -> void:
	var instance = sword_slash_scene.instantiate() as SwordSlash
	instance.source = source
	instance.position = source.position
	if source is Player:
		if source.sprite.flip_h:
			instance.position -= Vector3((instance.shape.size.x/2),0,0)
		else:
			instance.position += Vector3((instance.shape.size.x/2),0,0)
			
	get_tree().current_scene.add_child(instance)

func cast_requirements(source : LivingEntity, targets : Array[LivingEntity]) -> bool :
	if targets.size() > 0:
		return true
	return false
