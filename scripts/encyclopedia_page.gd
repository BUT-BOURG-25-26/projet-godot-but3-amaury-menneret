class_name EncyclopediaPage

extends Control

@onready var page_items : Array[Item] = []

func add_item(item : Item) :
	var case = TextureRect.new()
	case.size = Vector2(32,32)
	case.texture = item.icon
	case.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	case.position = Vector2(32*page_items.size(), 0)
	add_child(case)
	page_items.append(item)
