class_name Projectile

extends Node3D

@export var damage : float
@export var time_to_live : float
@onready var timer : Timer

func _ready() -> void:
	if time_to_live:
		timer = Timer.new()
		timer.wait_time = time_to_live
		timer.timeout.connect(timed_out)
		timer.start()
		
func timed_out() -> void:
	queue_free()

func collision() -> void:
	pass
