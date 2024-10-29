@tool
extends Resource
class_name Item

enum Category {
	resource,
	material,
	product,
	other
}

# 基本属性
@export var name: String = ""
@export var icon: Texture = null
@export var unit_space: float = 0.0
@export var category: Category = Category.other

# 燃料
@export var is_smelt: bool = false
@export var smelt_time: float = 0
