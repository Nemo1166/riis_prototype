extends Resource
class_name Currency

enum NAME {
	LMD,
	ticket
}

const LABEL = ['e61c', 'e61e']
const DISPLAY_NAME = ['LMD', 'Ticket']


@export var name: NAME

func _init(label: NAME):
	name = label

func gen_tag() -> String:
	return '[char=%s][b]%s[/b]' % [LABEL[name], DISPLAY_NAME[name]]