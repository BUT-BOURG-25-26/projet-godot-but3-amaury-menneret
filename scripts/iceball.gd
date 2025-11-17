extends ProjectileAttack

func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		(body as Enemy).take_damage(damage)
