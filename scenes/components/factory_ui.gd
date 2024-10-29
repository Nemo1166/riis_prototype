extends Control

@export var factory_name: String = '0'
@export var cost: int = 500
@export var is_built: bool = false

@export var craft_plan: Item = null
@export var craft_amount: int = 0

@onready var title: Label = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Top/Label
@onready var build: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Top/Build
@onready var set_craft_plan: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Top/SetCraftPlan
@onready var craft_panel = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Settings
@onready var production_logo: TextureRect = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Settings/HBoxContainer/TextureRect

var factory: Factory = Factory.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title.text = factory_name
	build.text = '建造\n\ue61c %d' % cost
	if is_built:
		set_craft_plan.visible = true
		build.visible = false
		craft_panel.visible = true
	else:
		set_craft_plan.visible = false
		build.visible = true
		craft_panel.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass






func build_factory() -> void:
	if ResourceMgr.wallet[ResourceMgr.CREDIT.LMD] >= cost:
		ResourceMgr.wallet[ResourceMgr.CREDIT.LMD] -= cost
		build.visible = false
		set_craft_plan.visible = true
		craft_panel.visible = true
		# ResourceMgr.w.store_item(ResourceMgr.items[factory_name], 1)
		# ResourceMgr.w.get_status()
	else:
		print("Not enough LMD")


func _on_build_button_up() -> void:
	build_factory()


func _on_set_craft_plan_button_up() -> void:
	$MarginContainer/PopupPanel.visible = true
	pass # Replace with function body.



func _on_craft_plan_selector_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	var product = factory.set_product(index)
	production_logo.texture = product.icon
	$MarginContainer/PopupPanel.visible = false
	
