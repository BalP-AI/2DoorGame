extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var monster: Monster = $Monster

func _ready() -> void:
	color_rect.color = choose_BackGround_Color(GlobalDoorPicker.getSelectedDoorType())
	chooseEntityTypeAndInit(GlobalDoorPicker.getSelectedDoorType())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func choose_BackGround_Color(roomType : String) -> Color:
	match roomType:
		"Monster":
			return Color.AQUAMARINE
		"Trap":
			return Color.RED
		"Loot":
			return Color.GOLD
		"Empty":
			return Color.GRAY
	return Color.WHEAT #This is default if this is shown smt went wrong
	
#TODO add the other entities as well and init them
func chooseEntityTypeAndInit(roomType : String) -> void:
	match roomType:
		"Monster":
			monster = Monster.new()
			init_Monster(monster)
		"Trap":
			monster = Monster.new()
			init_Monster(monster)
		"Loot":
			monster = Monster.new()
			init_Monster(monster)
		"Empty":
			monster = Monster.new()
			init_Monster(monster)
	pass
	
func init_Monster(entity : Monster) -> void:
	entity.set_looks(load("res://Graphics/Monsters/monster_1.png"))
	entity.position = Vector2(500, 200)
	pass
	
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/pick_a_door.tscn")
