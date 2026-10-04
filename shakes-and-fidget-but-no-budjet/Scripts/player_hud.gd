extends Control

@onready var margin: MarginContainer = $MarginContainer


func _on_check_button_pressed() -> void:
	if margin.visible:
		margin.visible = false
	else:
		margin.visible = true
