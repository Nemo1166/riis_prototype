extends Node

var player_name: String = 'Dr.'
var wallet: Dictionary = {}

var lmd = Currency.new(Currency.NAME.LMD)

func _ready() -> void:
	wallet[lmd] = 1000
	print('初始资金: %s %d' % [Currency.DISPLAY_NAME[lmd.name], wallet[lmd]])