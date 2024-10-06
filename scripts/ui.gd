extends CanvasLayer

var elapsed_time = 0.0
var player = null

func _ready():
	player = get_parent().get_node("Player")
	_on_player_health_changed(player.health)

func _process(delta):
	elapsed_time += delta
	update_timer_label()

func _on_player_health_changed(current_health):
	var health_bar = $Margins/HealthBarContainer/HealthBar
	health_bar.value = current_health

func update_timer_label():
	var timer_label = $Margins/SurvivalTimer
	var minutes = int(elapsed_time) / 60
	var seconds = int(elapsed_time) % 60
	var milliseconds = int((elapsed_time - int(elapsed_time)) * 100)
	timer_label.text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]

func _on_player_died() -> void:
	# Assuming you have an `elapsed_time` variable tracking survival time
	if elapsed_time > Global.high_score:
		Global.save_high_score(elapsed_time)

		get_tree().change_scene_to_file("res://scenes/title.tscn")
