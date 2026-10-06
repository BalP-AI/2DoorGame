extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneHandler.spawn_player_hud("Hub_World")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_dungeon_pressed() -> void:
	SceneHandler.switch_to_pick_a_door()
