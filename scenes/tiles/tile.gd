class_name CustomWorldTile

extends StaticBody3D

@export var meshInstance : MeshInstance3D
@onready var texture : Texture

func _ready() -> void:
	if texture and meshInstance:
		var material = StandardMaterial3D.new()
		material.albedo_texture = texture
		material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		meshInstance.set_surface_override_material(0, material)
