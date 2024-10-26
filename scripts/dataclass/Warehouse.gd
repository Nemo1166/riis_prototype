extends Node
class_name Warehouse

# 仓库属性
var title: String
var capacity: float
var used_space: float = 0

# 存储物品的字典，键为物品资源，值为物品数量
var inventory: Dictionary = {}

# 初始化仓库
func _init(_name: String = '0', _capacity = 1000):
	self.title = _name
	self.capacity = _capacity

# 存入物品
func store_item(item: Resource, quantity: int) -> int:
	var total_size = quantity * item.unit_space
	var available_space = capacity - used_space

	# 计算允许存入的最大数量
	var max_quantity = available_space / item.unit_space

	# 如果容量不足，则只存入最大允许数量
	if total_size > available_space:
		quantity = int(max_quantity)  # 调整数量为最大可存入数量
		if quantity <= 0:
			print("仓库空间不足，无法存入任何数量的 ", item.name)
			return 0
		print("仓库空间不足，仅存入 ", quantity, " 个 ", item.name)

	# 更新库存
	if inventory.has(item):
		inventory[item] += quantity
	else:
		inventory[item] = quantity

	# 更新已用空间
	used_space += quantity * item.unit_space
	print("已存入物品:", item.name, " 数量:", quantity)
	return quantity  # 返回实际存入的数量

# 取出物品
func remove_item(item: Resource, quantity: int) -> bool:
	if inventory.has(item) and inventory[item] >= quantity:
		# 计算取出物品的空间
		var total_size = quantity * item.unit_space
		
		# 更新库存
		inventory[item] -= quantity
		if inventory[item] <= 0:
			inventory.erase(item)

		# 更新已用空间
		used_space -= total_size
		print("已取出物品:", item.name, "数量:", quantity)
		return true
	else:
		print("库存中没有足够的物品")
		return false

# 检查仓库状态
func get_status():
	print('仓库 ', title, ' 的状态')
	print("仓库容量:", capacity, "已用空间:", used_space, "剩余空间:", capacity - used_space)
	print("当前库存:")
	for item in inventory.keys():
		print("- 物品:", item.name, " 数量:", inventory[item], " 单位占地:", item.unit_space)
