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
var max_avail_produce = 0  # 最大可生产量
var avail_produce: int = 0  # 当前可生产量
var actual_produce: int = 0  # 实际生产量
var material: Dictionary = {}  # 当前产品所需原料

# 初始化
func _init(_max_daily_production=60):
	self.max_daily_production = _max_daily_production

func update_avail_produce() -> void:
	if current_product != null:
		# 更新可生产量
		avail_produce = min(
			max_avail_produce,
			int(ResourceMgr.w.inventory[material.keys()[0]] / material.values()[0]))

# 设置产品
func set_product(product_id: int) -> Item:
	var recipe = recipes[product_id]
	current_product = recipe['product']
	material = recipe['material']
	max_avail_produce = int(max_daily_production / recipe['time'])
	avail_produce = min(
		max_avail_produce,
		int(ResourceMgr.w.inventory[material.keys()[0]] / material.values()[0]))
	return current_product

func produce() -> int:
	var t = 0
	if current_product == null:
		return 0
	if avail_produce == 0:
		return 0
	var flag = true
	while flag:
		# 检查原料是否足够
		if ResourceMgr.w.inventory[material.keys()[0]] < material.values()[0]:
			flag = false
			break
		# 检查是否超过最大生产量
		if avail_produce <= 0:
			flag = false
			break
		# 生产一份产品
		ResourceMgr.w.inventory[material.keys()[0]] -= material.values()[0]
		ResourceMgr.w.inventory[current_product] += 1
		avail_produce -= 1
		actual_produce += 1
		t = actual_produce
		actual_produce = 0
	return t
