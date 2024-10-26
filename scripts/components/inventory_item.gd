extends HSplitContainer
class_name InventoryItem


var item: Item
var amount: int


func _init(_item, _amount) -> void:
	self.custom_minimum_size = Vector2(64, 0)
	self.item = _item
	self.amount = _amount

func _ready() -> void:
	var item_name = Label.new()
	item_name.text = item.name
	item_name.label_settings = load("res://assets/fonts/style_normal.tres")
	self.add_child(item_name)

	var item_amount = Label.new()
	item_amount.text = str(amount)
	item_amount.label_settings = load("res://assets/fonts/style_number.tres")
	self.add_child(item_amount)

func _process(_delta: float) -> void:
	var item_amount = self.get_child(1)
	item_amount.text = str(amount)
