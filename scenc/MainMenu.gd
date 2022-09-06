extends Node2D
func _ready():
	Audio.play_bgm("BGM 00026.ogg")
	var menus=$main/button_list.get_children()
	for button in menus:
		button.connect("mouse_entered",self,"button_enter",[button])
		button.connect("mouse_exited",self,"button_exit",[button])
		button.connect("button_down",self,"button_down",[button])
func button_enter(button):
	Audio.play_se("SE 00067.wav")
	button.icon.region.position.x=320
func button_exit(button):
	button.icon.region.position.x=0
func button_down(button):
	Audio.play_se("SE 00065.wav")
