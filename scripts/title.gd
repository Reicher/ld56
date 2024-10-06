# TitleScreen.gd
extends Control

var input_enabled = false

func _ready():
	$HighScoreLabel.text = "Last High Score: %s" % round(Global.high_score)
	input_enabled = false  # Disable input at the beginning
	$AnimationPlayer.play("FadeIn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeIn":
		$AnimationPlayer.play("BlinkPrompt")
		input_enabled = true
	elif anim_name == "FadeOut":
		get_tree().change_scene_to_file("res://scenes/game.tscn")	

func _input(event: InputEvent) -> void:
	if event.is_pressed() and input_enabled:
		$AnimationPlayer.play("FadeOut")		
