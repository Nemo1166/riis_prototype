extends Control

@export var factory_name: String = '0'
@export var cost: int = 500
@export var is_built: bool = false

@export var craft_plan: Item = null
@export var craft_amount: int = 0

@onready var title: Label = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Top/Label
@onready var build: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Top/Build
@onready var set_craft_plan: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Top/SetCraftPlan
@onready var craft_setting_panel: PopupPanel = $MarginContainer/PopupPanel
@onready var craft_panel = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Settings
@onready var production_logo: TextureRect = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Settings/HBoxContainer/TextureRect
@onready var stat: Label = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Settings/HBoxContainer/Label


var factory: Factory = Factory.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title.text = factory_name
	build.text = '建造\n\ue61c %d' % cost
	if is_built:
		set_craft_plan.visible = true
		build.visible = false
		craft_panel.visible = true
		ResourceMgr.w.item_changed.connect(update_ui)
	else:
		set_craft_plan.visible = false
		build.visible = true
		craft_panel.visible = false
	pass # Replace with function body.


func update_ui(item: Item, _quantity: int) -> void:
	if is_built:
		if item == factory.material.keys()[0]:
			print('update_ui')
			factory.update_avail_produce()
			stat.text = '最大生产   %d/d\n可生产      %d' % [factory.max_avail_produce, factory.avail_produce]


func build_factory() -> void:
	if ResourceMgr.wallet[ResourceMgr.CREDIT.LMD] >= cost:
		ResourceMgr.wallet[ResourceMgr.CREDIT.LMD] -= cost
		build.hide()
		craft_panel.hide()
		set_craft_plan.show()
		is_built = true
		ResourceMgr.w.item_changed.connect(update_ui)
		# ResourceMgr.w.store_item(ResourceMgr.items[factory_name], 1)
		# ResourceMgr.w.get_status()
	else:
		print("Not enough LMD")


func produce() -> void:
	if is_built:
		factory.produce()
		update_ui(factory.material.keys()[0], ResourceMgr.w.inventory[factory.material.keys()[0]])
	else:
		print("Factory not built")


func _on_build_button_up() -> void:
	build_factory()


func _on_set_craft_plan_button_up() -> void:
	craft_setting_panel.show()
	craft_setting_panel.position = get_global_mouse_position()
	pass # Replace with function body.


func _on_craft_plan_selector_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	var product = factory.set_product(index)
	production_logo.texture = product.icon
	craft_setting_panel.hide()
	craft_panel.show()
	stat.text = '最大生产   %d/d\n可生产      %d' % [factory.max_avail_produce, factory.avail_produce]
