extends Node
class_name Factory

var items = ResourceMgr.items

# 配方数据，包含所需原料和生产时间
var recipes = [
	{'material': {items['stone']: 5}, 'product': items['stone_pkg'], "time": 3},
	{'material':{items['sugar']: 4}, 'product': items['sugar_pkg'], "time": 5},
	{'material': {items['iron']: 4}, 'product': items['iron_pkg'], "time": 5},
	{'material':{items['ester']: 4,}, 'product': items['ester_pkg'], "time": 10}]

# 工厂属性
var max_daily_production  # 每天最大生产量
var current_product: Item = null  # 当前生产中的产品
var avail_produce: int = 0  # 当前可生产量
var actual_pruce: int = 0  # 实际生产量
var material: Dictionary = {}  # 当前产品所需原料

# 初始化
func _init(_max_daily_production=60):
	self.max_daily_production = _max_daily_production

# 设置产品
func set_product(product_id: int) -> Item:
	var recipe = recipes[product_id]
	current_product = recipe['product']
	material = recipe['material']
	avail_produce = min(
		int(max_daily_production / recipe['time']),
		int(ResourceMgr.w.inventory[material.keys()[0]] / material.values()[0]))
	return current_product

func produce() -> void:
	pass
