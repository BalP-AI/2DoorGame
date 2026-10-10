
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

var weapon: Item_Class.Weapon
var chessplate: Item_Class.ChessPlate
var headgear: Item_Class.Helmet
var boots: Item_Class.Boots
var pants: Item_Class.Pants
var ring_1: Item_Class.Ring
var ring_2: Item_Class.Ring
var necklace: Item_Class.Necklace
var lucky_item: Item_Class.Lucky_Item

var inventory: Dictionary[String, Item_Class.BaseItem] = {}

const PLAYER_DATA_PATH = "res://data/player_data.json"
const INVENTORY_PATH = "res://data/player_inventory.json"


func _ready() -> void:
	init_player()
	pass

func init_player() -> void:
	var data: Dictionary = load_player_data()
	var data_inventory : Dictionary = load_player_inventory()
	
	if data.is_empty():
		push_error("Player initialization failed: no valid player data.")
		return
		
#oi times ton metavliton orizontai apo to json, ean den uparxei sto json, tote tha paroun ta default
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
	
	apply_inventory(data_inventory)
	print_inventory()
	print("Player initialized!")
	print("Texture: ", player_texture)
	
	

func load_player_inventory() -> Dictionary:
	if not FileAccess.file_exists(INVENTORY_PATH):
		push_warning("Inventory JSON not found: " + INVENTORY_PATH)
		return {}

	var file = FileAccess.open(INVENTORY_PATH, FileAccess.READ)
	if file == null:
		push_error("Could not open inventory JSON.")
		return {}

	var json_text = file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(json_text)
	if error != OK:
		push_error(
			"Inventory JSON parse error at line %d: %s"
			% [json.get_error_line(), json.get_error_message()]
		)
		return {}

	var data = json.data
	if not data is Dictionary:
		push_error("Inventory JSON must contain a JSON object.")
		return {}

	return data

func apply_inventory(inv: Dictionary) -> void:
	weapon     = assign_Equipment_from_json(Item_Class.Weapon,     inv.get("weapon", {}))
	inventory.set("weapon", weapon)

	headgear   = assign_Equipment_from_json(Item_Class.Helmet,     inv.get("headgear", {}))
	inventory.set("headgear", headgear)

	chessplate = assign_Equipment_from_json(Item_Class.ChessPlate, inv.get("chessplate", {}))
	inventory.set("chessplate", chessplate)

	boots      = assign_Equipment_from_json(Item_Class.Boots,      inv.get("boots", {}))
	inventory.set("boots", boots)

	pants      = assign_Equipment_from_json(Item_Class.Pants,      inv.get("pants", {}))
	inventory.set("pants", pants)

	ring_1     = assign_Equipment_from_json(Item_Class.Ring,       inv.get("ring_1", {}))
	inventory.set("ring_1", ring_1)

	ring_2     = assign_Equipment_from_json(Item_Class.Ring,       inv.get("ring_2", {}))
	inventory.set("ring_2", ring_2)

	necklace   = assign_Equipment_from_json(Item_Class.Necklace,   inv.get("necklace", {}))
	inventory.set("necklace", necklace)

	lucky_item = assign_Equipment_from_json(Item_Class.Lucky_Item, inv.get("lucky_item", {}))
	inventory.set("lucky_item", lucky_item)
# Generic builder: creates cls.new() and copies matching fields from the dict.
# Returns null if the slot entry is missing/empty.
func assign_Equipment_from_json(cls, d: Dictionary):
	if d.is_empty():
		return null
	var item = cls.new()
	for key in d.keys():
		if key in item:              # only copy fields that exist on the class
			item.set(key, d[key])
	return item

func load_player_data() -> Dictionary:
	if not FileAccess.file_exists(PLAYER_DATA_PATH): #ean den uparxei kan to arxeio json
		push_error("Player JSON file not found: " + PLAYER_DATA_PATH)
		return {}

	var file = FileAccess.open(PLAYER_DATA_PATH, FileAccess.READ)

	if file == null:
		push_error("Could not open player JSON file, or file is null.")
		return {}

	var json_text = file.get_as_text()
	file.close() #opote kanoume file stream eite gia READ/WRITE, kalo einai na gientai close()

	var json = JSON.new() #JSON einai class, JASON.new() einai object
	var error = json.parse(json_text)

	if error != OK:
		push_error(
			"JSON parse error at line %d: %s"
			% [json.get_error_line(), json.get_error_message()]
		)
		return {}

	var data = json.data

	if not data is Dictionary: #isos einai peritto
		push_error("Player JSON must contain a JSON object.")
		return {}

	return data


func print_inventory() -> void:
	for slot_key : String in inventory:
		var item : Item_Class.BaseItem = inventory[slot_key]
		print("Slot: ", slot_key)
		print("Name: ", item.item_name)
		print("Value: ", item.value)
		print("Required Level: ", item.required_level)

		if item is Item_Class.Weapon:
			var weapon_temp : Item_Class.Weapon = item as Item_Class.Weapon
			print("Damage: ", weapon_temp.damage)
			print("Multiplier: ", weapon_temp.multiplier)
			print("Effect: ", weapon_temp.effect)

		if item is Item_Class.ChessPlate:
			var chessplate_temp : Item_Class.ChessPlate = item as Item_Class.ChessPlate
			print("Armor: ", chessplate_temp.armor)
			print("Multiplier: ", chessplate_temp.multiplier)
			print("Effect: ", chessplate_temp.effect)

		if item is Item_Class.Helmet:
			var headgear_temp : Item_Class.Helmet = item as Item_Class.Helmet
			print("Armor: ", headgear_temp.armor)
			print("Multiplier: ", headgear_temp.multiplier)
			print("Effect: ", headgear_temp.effect)

		if item is Item_Class.Boots:
			var boots_temp : Item_Class.Boots = item as Item_Class.Boots
			print("Armor: ", boots_temp.armor)
			print("Multiplier: ", boots_temp.multiplier)
			print("Effect: ", boots_temp.effect)

		if item is Item_Class.Ring:
			var ring_1_temp : Item_Class.Ring = item as Item_Class.Ring
			print("Armor: ", ring_1_temp.armor)
			print("Multiplier: ", ring_1_temp.multiplier)
			print("Effect: ", ring_1_temp.effect)

		if item is Item_Class.Ring:
			var ring_2_temp : Item_Class.Ring = item as Item_Class.Ring
			print("Armor: ", ring_2_temp.armor)
			print("Multiplier: ", ring_2_temp.multiplier)
			print("Effect: ", ring_2_temp.effect)

		if item is Item_Class.Necklace:
			var necklace_temp : Item_Class.Necklace = item as Item_Class.Necklace
			print("Armor: ", necklace_temp.armor)
			print("Multiplier: ", necklace_temp.multiplier)
			print("Effect: ", necklace_temp.effect)

		if item is Item_Class.Pants:
			var pants_temp : Item_Class.Pants = item as Item_Class.Pants
			print("Armor: ", pants_temp.armor)
			print("Multiplier: ", pants_temp.multiplier)
			print("Effect: ", pants_temp.effect)

		if item is Item_Class.Lucky_Item:
			var lucky_item_temp : Item_Class.Lucky_Item = item as Item_Class.Lucky_Item
			print("Armor: ", lucky_item_temp.armor)
			print("Multiplier: ", lucky_item_temp.multiplier)
			print("Effect: ", lucky_item_temp.effect)

		print("---------------")
