class_name Boss

extends LivingEntity

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y -= gravity * delta
