extends Control
onready var dialog=$dialog
onready var text=$dialog/text
onready var tween=$dialog/text/Tween
onready var role=$dialog/name
func _ready():
	Command.command_next()
func set_name(txt):
	role.text=txt
func set_text(txt):
	tween.stop(text)
	var time=txt.length()*0.04
	text.text=txt
	text.percent_visible=0
	tween.interpolate_property(text,"percent_visible",0,1,time,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
func set_char(path,pos):
	get_node("char/"+pos).texture=load("res://assets/char/"+path)
	Command.command_next()
func clear_char(pos):
	if pos=="all":
		$char/center.texture=null
		$char/left.texture=null
		$char/right.texture=null
	else:
		get_node("char/"+pos).texture=null
func _on_Button_button_down():
	if  dialog.visible and text.percent_visible==1  and !tween.is_active():
		Command.command_next()
	elif tween.is_active():
		text.percent_visible=1
		tween.remove_all()



func _input(event):
	print(6)
	if Input.is_action_pressed("ui_skip"):
		Command.command_next()
