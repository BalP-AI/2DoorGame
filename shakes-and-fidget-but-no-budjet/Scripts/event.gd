extends Control

@onready var color_rect: ColorRect = $ColorRect

const MONSTER = preload("uid://cc6j7fj4q8jlj")

var mon = MONSTER.instantiate()

func _ready() -> void:
	color_rect.color = choose_BackGround_Color(GlobalDoorPicker.getSelectedDoorType())
	chooseEntityTypeAndInit(GlobalDoorPicker.getSelectedDoorType())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
			add_child(mon)
			init_Monster(mon)
		"Trap":
			add_child(mon)
			init_Monster(mon)
		"Loot":
			add_child(mon)
			init_Monster(mon)
		"Empty":
			add_child(mon)
			init_Monster(mon)
	pass
	
func init_Monster(entity : Monster) -> void:
	entity.set_looks(load("res://Graphics/Monsters/monster_1.png")) #dynamic monster generation
	entity.position = Vector2(500, 200)
	
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/pick_a_door.tscn")
