extends Node3D

@onready var box : StaticBody3D = $StaticBody3D2
@onready var box_coordinates : Vector2

func _ready() -> void:
	box.position = Vector3(box_coordinates.x, 0.25, box_coordinates.y)
