extends Node

var w: Warehouse = Warehouse.new()

var items: Dictionary = {
	# res
	'stone': load("res://scripts/dataclass/Items/resources/stone.tres"),
	'sugar': load("res://scripts/dataclass/Items/resources/sugar.tres"),
	'iron': load("res://scripts/dataclass/Items/resources/iron.tres"),
	'ester': load("res://scripts/dataclass/Items/resources/ester.tres"),
	# mtl
	'stone_pkg': load("res://scripts/dataclass/Items/materials/stone_pkg.tres"),
	'sugar_pkg': load("res://scripts/dataclass/Items/materials/sugar_pkg.tres"),
	'iron_pkg': load("res://scripts/dataclass/Items/materials/iron_pkg.tres"),
	'ester_pkg': load("res://scripts/dataclass/Items/materials/ester_pkg.tres"),
	# prod
	#'stone_pkg': load("res://scripts/dataclass/Items/materials/stone_pkg.tres"),
	#'sugar_pkg': load("res://scripts/dataclass/Items/materials/sugar_pkg.tres"),
	#'iron_pkg': load("res://scripts/dataclass/Items/materials/iron_pkg.tres"),
	#'ester_pkg': load("res://scripts/dataclass/Items/materials/ester_pkg.tres"),
}

func _ready() -> void:
	for item in items.keys():
		w.store_item(items[item], 0)
	#w.store_item(crystal, 1000)
	w.get_status()

var time_elapsed = 0
func _process(delta: float) -> void:
	time_elapsed += delta
	if time_elapsed >=1:
		time_elapsed = 0
		pass
