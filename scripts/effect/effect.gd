class_name Effect

extends Node

@export var effect_name : String
@export var effect_description : String
@export var ticks : int
@export var cooldown : float
@export var target : LivingEntity
@export var animation : Animation

func apply() -> void :
	ticks -= 1

func can_apply() -> bool :
	return ticks > 0 and target
