class_name skillListDisplay

extends Control

@onready var skills : Dictionary

func _ready() -> void:
	skills = {}

func add_skill(skill : ProjectileAttack) :
	var texture = TextureRect.new()
	texture.texture = skill.icon
	texture.size = Vector2(32,32)
	texture.position = Vector2(0, 0 + (32 * skills.size()))
	texture.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	add_child(texture)
	skills.set(skill, skills.size())
