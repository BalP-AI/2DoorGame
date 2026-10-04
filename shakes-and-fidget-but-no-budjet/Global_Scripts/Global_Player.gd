
extends Node

var player_texture : String
var totalHealth: int = 0
var currentHealth: int = 0
var level: int = 0
var expToLevel: int = 0
var curExp: int = 0
var armor: int = 0
var gold: int = 0
var speed: int = 0
var atk: int = 0
var def: int = 0
var status: int = 0
var healing_fact: float = 1.0

var weapon: Item_Class
var chessplate: Item_Class
var headgear: Item_Class
var boots: Item_Class
var pants: Item_Class
var ring_1: Item_Class
var ring_2: Item_Class
var necklace: Item_Class
var lucky_item: Item_Class


const PLAYER_DATA_PATH = "res://data/player_data.json"


func _ready() -> void:
	init_player()
	pass

func init_player() -> void:
	var data: Dictionary = load_player_data()

	if data.is_empty():
		push_error("Player initialization failed: no valid player data.")
		return

	totalHealth = int(data.get("totalHealth", 100))
	currentHealth = int(data.get("currentHealth", totalHealth))
	level = int(data.get("level", 1))
	expToLevel = int(data.get("expToLevel", 100))
	curExp = int(data.get("curExp", 0))
	armor = int(data.get("armor", 0))
	gold = int(data.get("gold", 0))
	speed = int(data.get("speed", 100))
	atk = int(data.get("atk", 1))
	def = int(data.get("def", 0))
	status = int(data.get("status", 0))
	healing_fact = float(data.get("healing_fact", 1.0))
	player_texture = str(data.get("sprite","res://icon.svg"))
	
	print("Player initialized!")
	print("Texture: ", player_texture)
	


func load_player_data() -> Dictionary:
	if not FileAccess.file_exists(PLAYER_DATA_PATH):
		push_error("Player JSON file not found: " + PLAYER_DATA_PATH)
		return {}

	var file = FileAccess.open(PLAYER_DATA_PATH, FileAccess.READ)

	if file == null:
		push_error("Could not open player JSON file.")
		return {}

	var json_text = file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(json_text)

	if error != OK:
		push_error(
			"JSON parse error at line %d: %s"
			% [json.get_error_line(), json.get_error_message()]
		)
		return {}

	var data = json.data

	if not data is Dictionary:
		push_error("Player JSON must contain a JSON object.")
		return {}

	return data
