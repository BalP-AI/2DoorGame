extends Control

@onready var color_rect: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
var col 

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/pick_a_door.tscn")
