extends Control

@onready var door_1: TextureButton = $MarginContainer/HBoxContainer/door1
@onready var door_2: TextureButton = $MarginContainer/HBoxContainer/door2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneHandler.spawn_player_hud("pick_a_door")
	print("New Doors Spawned")
	_spawn_doors()
	
	
func _process(_delta: float) -> void:
	pass
	
#=========== Helper Methods ==============#
func _spawn_doors() -> void:
	var door1_type: String
	var door2_type: String
	door1_type = _pick_door_type()
	door2_type = _pick_door_type()

	var door1_path: String = _pick_door_path(door1_type)
	var door2_path: String = _pick_door_path(door2_type)

	_apply_door_textures(door_1, door1_path)
	_apply_door_textures(door_2, door2_path)

	_save_door_types(door1_type, door2_type)
	_debug_print_doors(door1_type, door2_type, door1_path, door2_path)

func _pick_door_type() -> String:
	return GlobalDoorPicker.door_types.keys().pick_random()

func _pick_door_path(door_type: String) -> String:
	return GlobalDoorPicker.door_types[door_type].pick_random()

func _apply_door_textures(door: TextureButton, path: String) -> void:
	door.texture_normal = load("%sclosed.png" % path)
	door.texture_hover  = load("%shover.png"  % path)

func _save_door_types(type1: String, type2: String) -> void:
	GlobalDoorPicker.door_1_type = type1
	GlobalDoorPicker.door_2_type = type2

func _debug_print_doors(t1: String, t2: String, p1: String, p2: String) -> void:
	print("%sclosed.png / %shover.png" % [p1, p1])
	print("%sclosed.png / %shover.png" % [p2, p2])
	print("Global 1:" + t1)
	print("Global 2:" + t2)

func _on_door_1_pressed() -> void:
	GlobalDoorPicker.door_1_select = true
	GlobalDoorPicker.door_2_select = false
	to_event()

func _on_door_2_pressed() -> void:
	GlobalDoorPicker.door_1_select = false
	GlobalDoorPicker.door_2_select = true
	to_event()

func to_event():
	SceneHandler.switch_to_event()
