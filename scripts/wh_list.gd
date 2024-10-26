extends VBoxContainer

@onready var item_tab: TabBar = $".."

var w = ResourceMgr.w

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var category = item_tab.get_meta('category')
	init_display_list(category)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_display_list()

func init_display_list(category: int):
	for item in w.inventory.keys():
		if item.category == category:
			var item_label = InventoryItem.new(item, w.inventory[item])
			self.add_child(item_label)

func update_display_list():
	var children = self.get_children()
	if len(children) > 0:
		for child: InventoryItem in children:
			var item = child.item
			child.amount = w.inventory[item]
