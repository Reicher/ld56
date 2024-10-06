extends CharacterBody2D

@export var speed = 400
@export var max_health = 100

var health = max_health
signal health_changed(current_health)
signal died

func _ready() -> void:
	health = max_health

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _process(delta: float) -> void:
	var angle = get_angle_to(get_global_mouse_position())
	rotate(angle)

func take_damage(amount):
	health -= amount
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("died")
