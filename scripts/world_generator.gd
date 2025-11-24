extends Node

const GENERATION_BOUND_DISTANCE = 50

var noise = FastNoiseLite.new()
var player: Node
var generated_tiles : Dictionary

@export var tileSize : int = 5

const textures = {
	1 : preload("res://sprites/tiles/dirt.png"),
	2 : preload("res://sprites/tiles/grass.png"),
	3 : preload("res://sprites/tiles/grass_patch_1.png"),
	4 : preload("res://sprites/tiles/red_flower.png"),
	5 : preload("res://sprites/tiles/yellow_flower.png")
}

var tileScene : PackedScene = load("res://scenes/tiles/tile.tscn")

func _ready():
	noise.seed = randf_range(0,10000)
	
	generated_tiles={}
	
	player=get_node("../Player")
	generate_new_tiles_from_position(Vector2(player.global_position.x,player.global_position.z))

func tile_near_player(player_position:Vector2, coordinates:Vector2):
	if coordinates.distance_to(player_position) > GENERATION_BOUND_DISTANCE:
		return false
	return true
	
func check_all_tiles_from_position(player_position:Vector2):
	for x in generated_tiles:
		if !tile_near_player(player_position, x):
			unload_tile_at_position(x)
				
func unload_tile_at_position(coordinates:Vector2):
	if(generated_tiles.get(coordinates) != null):
		generated_tiles.get(coordinates).queue_free()

func generate_new_tiles_from_position(player_position:Vector2):
	for x in range(GENERATION_BOUND_DISTANCE*2):
		x += (player_position.x - GENERATION_BOUND_DISTANCE)
		for z in range(GENERATION_BOUND_DISTANCE*2):
			z += (player_position.y - GENERATION_BOUND_DISTANCE)
			if x%5 == 0 && z%5 == 0 and Vector2(x,z).distance_to(Vector2(player_position.x,player_position.y)) < GENERATION_BOUND_DISTANCE:
				await generate_tile_if_new(x, z)

func generate_tile_if_new(x,z):
	if !has_tile_been_generated(Vector2(x,z)):
		register_tile_generation_at_coordinate(x,z)

func has_tile_been_generated(x):
	if x in generated_tiles and generated_tiles.get(x) != null:
		return true
	else:
		return false

func register_tile_generation_at_coordinate(x,z):
	generated_tiles.set(Vector2(x,z), create_tile(Vector3(x,0,z)))

func _process(delta):
	generate_new_tiles_from_position(Vector2(player.global_position.x, player.global_position.z))
	check_all_tiles_from_position(Vector2(player.global_position.x, player.global_position.z))
	pass
	
func create_tile(position):
	var scene : CustomWorldTile = tileScene.instantiate()
	
	scene.position = position
	
	#var collisionShape = BoxShape3D.new()
	#collisionShape.size = Vector3(tileSize,0,tileSize)
	#scene.collisionShape.shape = collisionShape
	#var meshInstance = PlaneMesh.new()
	#meshInstance.size = Vector2(tileSize,tileSize)
	#scene.meshInstance.mesh = meshInstance
	scene.texture = textures[int(remap(noise.get_noise_2d(position.x, position.z), -1, 1, 1, textures.size()))]
	
	add_child(scene)
	return scene
		
func get_child_coordinates_from_noise(coordinates : Vector3):
	return Vector2(0,0)
