class_name Projectile

extends Node3D

@export var damage : float
@export var time_to_live : float = 1
@export var speed : float

#func _ready() -> void:
	#if time_to_live:
		#var timer = Timer.new()
		#add_child(timer)
		#timer.start(time_to_live)
		#timer.timeout.connect(timed_out)

func timed_out() -> void:
	print("QUEUE FREE MAGIC ARROW")
	queue_free()

func _physics_process(delta: float) -> void:
	position += rotation * speed

func collision() -> void:
	pass
