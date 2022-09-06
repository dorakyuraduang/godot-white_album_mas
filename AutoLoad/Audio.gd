extends Node
var game
onready	var bgm=AudioStreamPlayer.new()
onready	var se=AudioStreamPlayer.new()
onready	var viceo=AudioStreamPlayer.new()
func _ready():
	add_child(bgm)
	add_child(se)
	add_child(viceo)
func play_bgm(path):
	bgm.stream=load("res://assets/bgm/"+path)
	bgm.play()
func stop_bgm():
	bgm.stop()
func play_viceo(path):
	viceo.stream=load("res://assets/viceo/"+path)
	viceo.stream.loop=false
	viceo.play()
func play_se(path):
	se.stream=load("res://assets/se/"+path)
	se.play()
