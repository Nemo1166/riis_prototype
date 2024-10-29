extends HBoxContainer

@onready var currency_label: RichTextLabel = $PanelContainer/MarginContainer/RichTextLabel
@onready var amount_label: Label = $PanelContainer2/MarginContainer/Label

@export var credit_name: ResourceMgr.CREDIT


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_amount()


func update_amount() -> void:
	amount_label.text = str(ResourceMgr.wallet[credit_name])
