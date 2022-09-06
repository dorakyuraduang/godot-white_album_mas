extends Node
var command_list=[]
var command_num=0
var viceo_num=0
var game
func parse_script(path:String):
	command_num=0
	viceo_num=0
	command_list=[]
	var file = File.new()
	file.open("res://assets/script/"+path+".txt",File.READ)
	var script=file.get_as_text()
	var lines=script.split("\n", true)
	file.close()
	for line in lines:
		line=line.strip_edges(true,false)
		command_list.push_back(line.split(" ", true, 1))
	get_tree().change_scene("res://scenc/game.tscn")
func command_next():
	game=get_tree().get_root().find_node("game",true,false)
	var command=command_list[command_num]
	command_num+=1
	match command[0]:
		"mv":
			var video=load("res://components/VideoPlayer.tscn").instance()
			video.stream=load("res://assets/mv/mv"+command[1]+".webm")
			yield(get_tree().create_timer(1),"timeout")
			self.add_child(video)
		"go":
			print(66)
			parse_script(command[1])
		"bgm":
				Audio.play_bgm(command[1])
				command_next()
		"viceo":
				Audio.play_viceo(command[1])
				command_next()
		"bg":
			game.get_node("bg").texture=load("res://assets/bak/"+command[1])
			command_next()
		"effect":
			$start/dialog.visible=false
			$start/bg.visible=false
			$start/AnimationPlayer.play(command[1])
		"go":
			parse_script(command[1])
		"char":
			var args=command[1].split(" ",true,1)
			if args[0]=="clear":
				if args.size()==1:
					args.push_back("all")
				game.clear_char(args[1])
			else:
				if args.size()==1:
					args.push_back("center")
				game.set_char(args[0].strip_edges(true,false),args[1])
		_:
			var text_list=command[0].split(":", true)
			if text_list.size()>1:
				viceo_num+=1
				var text=text_list[1].replace("\\n","\n")
				game.set_name(text_list[0])
				game.set_text(text)
				print("voice 0000".substr(0,10-viceo_num/10))
				Audio.play_viceo("voice 00000".substr(0,11-String(viceo_num).length()
)+String(viceo_num)+".ogg")
			else:
				game.set_name("")
				game.set_text(command[0].replace("\\n","\n").strip_edges(true,false))
