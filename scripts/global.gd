# flobal.gd
extends Node

var high_score = 0

func _ready():
	load_high_score()

func load_high_score():
	var save_path = "user://save_game.save"
	var file = FileAccess.open(save_path, FileAccess.ModeFlags.READ)
	if file:
		high_score = file.get_var()
		file.close()

func save_high_score(new_score):
	high_score = new_score
	var save_path = "user://save_game.save"
	var file = FileAccess.open(save_path, FileAccess.ModeFlags.WRITE)
	file.store_var(high_score)
	file.close()
