extends Control

@onready var show_fps: Label = $UILayer/FrameStat/showFPS
@onready var show_fgen: Label = $UILayer/FrameStat/showFgen
@onready var warehouse_volume: ProgressBar = $LfetPanel/ProgressBar
@onready var today: Label = $UILayer/Time/Today
@onready var avail_acts: Label = $UILayer/Time/AvailActs
@onready var sell_pool: GridContainer = $"RightPanel/TabContainer/出售/GridContainer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	today.text = '第 %d 天' % Global.days
	avail_acts.text = '◗'.repeat(Global.acts)
	var fps = 1 / delta
	show_fps.text = 'FPS: %.2f' % fps
	show_fgen.text = 'Frame time: %.2f ms' % [delta*1000]
	warehouse_volume.value = ResourceMgr.w.used_space / ResourceMgr.w.capacity






func _on_end_day_button_up() -> void:
	$"RightPanel/TabContainer/制造/FactoryUI".produce()
	$"RightPanel/TabContainer/制造/FactoryUI2".produce()
	$"RightPanel/TabContainer/制造/FactoryUI3".produce()
	$"RightPanel/TabContainer/制造/FactoryUI4".produce()
	Global.end_a_day()
	var sell_prod = preload("res://scenes/components/sell_item.tscn")
	sell_prod = sell_prod.instantiate()
	sell_prod.init(preload("res://scripts/dataclass/Items/materials/stone_pkg.tres"), 6, 2000)
	sell_pool.add_child(sell_prod)
	


func _on_mine_1_button_up() -> void:
	var mine_coef = $"RightPanel/TabContainer/采集/Mine1".get_meta('mine_coef')
	ResourceMgr.mine(mine_coef)


func _on_mine_2_button_up() -> void:
	var mine_coef = $"RightPanel/TabContainer/采集/Mine2".get_meta('mine_coef')
	ResourceMgr.mine(mine_coef)


func _on_mine_3_button_up() -> void:
	var mine_coef = $"RightPanel/TabContainer/采集/Mine3".get_meta('mine_coef')
	ResourceMgr.mine(mine_coef)


func _on_mine_4_button_up() -> void:
	var mine_coef = $"RightPanel/TabContainer/采集/Mine4".get_meta('mine_coef')
	ResourceMgr.mine(mine_coef)
