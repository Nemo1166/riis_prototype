extends Node

const MAX_ACTION_A_DAY = 3

# status
var days: int = 1

var acts = MAX_ACTION_A_DAY

func is_actable():
	if acts>0:
		return true
	else:
		return false

func end_a_day():
	acts = MAX_ACTION_A_DAY
	days += 1
