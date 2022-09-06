extends VBoxContainer
func _ready():
	$start.connect("button_down",System,"game_start")
