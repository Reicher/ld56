extends Timer

# EnemySpawner.gd
@export var spawn_distance = 500  # Distance from the player to spawn enemies
@export var enemy_scenes = [preload("res://scenes/Enemy.tscn")]  # Array of PackedScene references to Enemy1, Enemy2, Enemy3

var player_ref = null

func _ready():
	player_ref = get_parent().get_node("Player")  # Adjust the path as necessary

func spawn_enemy():	
	if enemy_scenes.size() == 0 or player_ref == null:
		return

	# Choose a random enemy type
	var enemy_scene = enemy_scenes[randi() % enemy_scenes.size()]
	var enemy_instance = enemy_scene.instantiate()

	# Calculate spawn position
	var angle = randf() * TAU
	var spawn_position = player_ref.global_position + Vector2(spawn_distance, 0).rotated(angle)
	enemy_instance.global_position = spawn_position

	# Set the player as the target
	enemy_instance.target = player_ref

	# Add the enemy to the scene
	get_tree().get_current_scene().add_child(enemy_instance)


func _on_timeout() -> void:
	spawn_enemy()
