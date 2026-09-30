extends Control

const MAIN_MENU = preload("uid://bfutal0d5qugq")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_dungeon_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/pick_a_door.tscn")
