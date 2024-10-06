extends Control

var elapsed_time = 0.0

func _process(delta):
	elapsed_time += delta
	if elapsed_time >= 4.0:
		$AnimationPlayer.play("FadeOutStory")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn")
