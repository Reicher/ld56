# Flamethrower.gd (Attach this script to the Flamethrower node)
extends Node2D

var damage = 150

var enemies_in_area = []

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		enemies_in_area.append(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		enemies_in_area.erase(body)

func _process(delta):
	for enemy in enemies_in_area:
		if enemy and enemy.is_inside_tree():
			enemy.take_damage(damage * delta)
