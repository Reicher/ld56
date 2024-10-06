# Enemy.gd
extends CharacterBody2D

@export var speed = 100
@export var max_health = 100
@export var damage = 10

var health = max_health
var target = null  # Will be set to the player instance

func _ready():
	health = max_health

func _physics_process(delta):
	if target:
		move_towards_target(delta)

func move_towards_target(delta):
	var direction = (target.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()

func die():
	# Play death animation or effects
	queue_free()

func _on_dangerzone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.take_damage(damage)
		die()
