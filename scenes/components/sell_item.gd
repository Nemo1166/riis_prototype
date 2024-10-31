extends Control

@export var item: Item = null
@export var amount: int = 1
@export var reward: int = 1

@onready var item_icon: TextureRect = $HBoxContainer/TextureRect
@onready var item_amount: Label = $HBoxContainer/TextureRect/Panel/Label
@onready var reward_text: RichTextLabel = $HBoxContainer/RichTextLabel
@onready var highlight: Panel = $Panel


func init(_item: Item, _amount: int, _reward: int) -> void:
	item = _item
	amount = _amount
	reward = _reward
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_icon.texture = item.icon
	print(item, amount, reward)
	item_amount.text = str(amount)
	reward_text.text = "-->      [char=e61c] " + str(reward)


func sell() -> void:
	var inv_amount = ResourceMgr.w.has_item(item)
	if inv_amount >= amount:
		inv_amount -= amount
		ResourceMgr.w.remove_item(item, amount)
		ResourceMgr.wallet[ResourceMgr.CREDIT.LMD] += reward
		print('sell')
		Global.acts -= 1
		queue_free()
	else:
		print('not enough items')


func _on_mouse_entered() -> void:
	#print('hover')
	highlight.show()


func _on_mouse_exited() -> void:
	#print('leave')
	highlight.hide()


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print('clicked')
		if Global.acts > 0:
			sell()
		else:
			print('no actions')
