class_name Effect

extends Node

@export var effect_name : String
@export var effect_description : String
@export var ticks : int
@export var cooldown : float
@export var animation : Animation

func apply(target : LivingEntity) -> void :
	pass

func can_apply(target :  LivingEntity) -> bool :
	return false
