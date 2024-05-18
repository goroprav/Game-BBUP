extends Area2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_body_entered(body:CharacterBody2D):
	get_tree().change_scene_to_file("res://First room.tscn")
