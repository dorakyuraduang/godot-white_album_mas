extends Node
func game_start():
	Change.get_node("AnimationPlayer").play("fade")
	yield(Change.get_node("AnimationPlayer"),"animation_finished")
	Change.get_node("balck").modulate.a=0
	Command.parse_script("6001")
