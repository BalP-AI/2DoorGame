extends Control

@onready var start: TextureButton = $MarginContainer/VBox/start
@onready var about: TextureButton = $MarginContainer/VBox/about
@onready var options: TextureButton = $MarginContainer/VBox/options
@onready var exit: TextureButton = $MarginContainer/VBox/exit
@onready var about_info: ColorRect = $about_info

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_about_pressed() -> void:
	about_info.visible = true


func _on_exit_about_pressed() -> void:
	about_info.visible = false


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/hub_world.tscn")
