@tool

extends Node3D

@export var meshInstance : MeshInstance3D 

var noise = FastNoiseLite.new()

var surface_array = []

var verts = PackedVector3Array()
var uvs = PackedVector2Array()
var normals = PackedVector3Array()
var indices = PackedInt32Array()

func _ready() -> void:
	if Engine.is_editor_hint():
		surface_array.resize(Mesh.ARRAY_MAX)
		
		for x in 10:
			for z in 10:
				verts.append(Vector3(x,noise.get_noise_2d(x,z),z))
		
		for i in range(verts.size()):
			uvs.append(Vector2(verts[i].x, verts[i].z)) # Simple UV mapping
			normals.append(Vector3(0, 1, 0)) # Flat surface normals (can be calculated more accurately)
		
		# Generate indices for a grid of triangles (you may need to refine this for your actual geometry)
		for x in range(9):
			for z in range(9):
				var i0 = x + z * 10
				var i1 = (x + 1) + z * 10
				var i2 = x + (z + 1) * 10
				var i3 = (x + 1) + (z + 1) * 10
				indices.append(i0)
				indices.append(i2)
				indices.append(i1)
				indices.append(i1)
				indices.append(i2)
				indices.append(i3)
		
		surface_array[Mesh.ARRAY_VERTEX] = verts
		surface_array[Mesh.ARRAY_TEX_UV] = uvs
		surface_array[Mesh.ARRAY_NORMAL] = normals
		surface_array[Mesh.ARRAY_INDEX] = indices

		meshInstance.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)

func _physics_process(delta: float) -> void:
	pass
