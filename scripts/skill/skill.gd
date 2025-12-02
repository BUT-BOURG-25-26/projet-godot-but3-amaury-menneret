class_name Skill

extends Node

@export var skill_name : String
@export var skill_description : String
@export var cooldown : float
@export var level : int = 1

func cast() -> void :
	pass
	
func cast_requirements() -> bool :
	return false

func cast_effects() -> void :
	pass

func level_up() -> void :
	level += 1
