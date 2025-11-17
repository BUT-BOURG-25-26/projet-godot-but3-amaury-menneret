class_name KillAura

extends Area3D

@export var damage : int = 1

var enemies_in_range

func _ready() -> void:
	enemies_in_range = []

func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		enemies_in_range.append(body)


func _on_cooldown_timeout() -> void:
	for x in enemies_in_range:
		if(x != null):
			(x as Enemy).take_damage(damage)


func _on_body_exited(body: Node3D) -> void:
	if body is Enemy and enemies_in_range.find(body) != null:
		enemies_in_range.erase(body)
