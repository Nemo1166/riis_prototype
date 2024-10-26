extends Control

@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var show_fps: Label = $FreamStat/showFPS
@onready var show_fgen: Label = $FreamStat/showFgen
@onready var warehouse_volume: ProgressBar = $LfetPanel/ProgressBar
@onready var today: Label = $UILayer/Today

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rich_text_label.bbcode_enabled = true
	rich_text_label.text = 'aaa'+PlayerStats.lmd.gen_tag()+'bbb'
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	today.text = '第 %d 天' % Global.days
	var fps = 1 / delta
	show_fps.text = 'FPS: %.2f' % fps
	show_fgen.text = 'Frame time: %.2f ms' % [delta*1000]
	warehouse_volume.value = ResourceMgr.w.used_space / ResourceMgr.w.capacity


const BASIC_MINE = [100, 50, 20, 5]





func _on_end_day_button_up() -> void:
	Global.end_a_day()
