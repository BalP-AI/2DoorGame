extends Control

@onready var door_1: TextureButton = $MarginContainer/HBoxContainer/door1
@onready var door_2: TextureButton = $MarginContainer/HBoxContainer/door2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#this is a test second time
	print("New Doors Spawned")
	var keys: Array = GlobalDoorPicker.door_types.keys()

	var door1_type: String = keys.pick_random()
	var door2_type: String = keys.pick_random()

	var door1: String = GlobalDoorPicker.door_types[door1_type].pick_random()
	var door2: String = GlobalDoorPicker.door_types[door2_type].pick_random()

	door_1.texture_normal = load("%sclosed.png" % door1)
	door_1.texture_hover  = load("%shover.png"  % door1)
	print("%sclosed.png / %shover.png" % [door1, door1])

	door_2.texture_normal = load("%sclosed.png" % door2)
	door_2.texture_hover  = load("%shover.png"  % door2)
	print("%sclosed.png / %shover.png" % [door2, door2])


	GlobalDoorPicker.door_1_type = door1_type
	GlobalDoorPicker.door_2_type = door2_type
	print("Global 1:" + GlobalDoorPicker.door_1_type)
	print("Global 2:" + GlobalDoorPicker.door_2_type)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_door_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/event.tscn")
func _on_door_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/event.tscn")
