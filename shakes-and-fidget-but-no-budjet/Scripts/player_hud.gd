extends Control

@onready var margin: MarginContainer = $MarginContainer
@onready var player_image: TextureRect = $MarginContainer/HBoxContainer/Player_Icon/Player_Image

func _ready() -> void:
	set_player_portait(GlobalPlayer.player_texture)
	pass

func _on_check_button_pressed() -> void:
	if margin.visible:
		margin.visible = false
	else:
		margin.visible = true

func set_player_portait(image : String) -> void:
	player_image.texture = load(image)
