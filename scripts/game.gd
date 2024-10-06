extends Node2D

@onready var player = $Player
@onready var health_bar = $UI/Margins/HealthBarContainer/HealthBar

var elapsed_time = 0.0

func _ready():	
	health_bar.value = player.health

func _on_player_health_changed(current_health: Variant) -> void:
	print("AOUCH" + str(current_health))
	health_bar.value = current_health

func update_timer_label():
	var timer_label = $UI/Margins/SurvivalTimer
	var minutes = int(elapsed_time) / 60
	var seconds = int(elapsed_time) % 60
	var milliseconds = int((elapsed_time - int(elapsed_time)) * 100)
	timer_label.text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]

func _process(delta):
	elapsed_time += delta
	update_timer_label()
