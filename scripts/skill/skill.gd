class_name Skill

extends Node

@export var skill_name : String
@export var skill_description : String
@export var cooldown : float
@export var level : int = 1
@export var mana_cost : int = 5
@export var max_target_nb : int = 1

func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void :
	pass
	
func cast_requirements(source : LivingEntity, targets : Array[LivingEntity]) -> bool :
	return false

func cast_effects(source : LivingEntity) -> void :
	pass

func level_up() -> void :
	level += 1
