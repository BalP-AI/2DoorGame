extends Node


const EVENT = preload("uid://dc8av1815esfk")
const HUB_WORLD = preload("uid://bgdylqavqucks")
const ITEM_CLASS = preload("uid://deepqy3wrsnlp")
const MAIN_MENU = preload("uid://bfutal0d5qugq")
const MONSTER = preload("uid://cc6j7fj4q8jlj")
const PICK_A_DOOR = preload("uid://8ovgy4rccy2x")
const PLAYER = preload("uid://d0ml78kind4nr")
const PLAYER_HUD = preload("uid://bu7nc6c2t0wm4")



func switch_to_scene(sc: String):
	match sc:
		"Main_Menu":
			switch_to_hub_world()
		"hub_world":
			switch_to_pick_a_door()
		"pick_a_door":
			switch_to_event()
		"event":
			switch_to_pick_a_door()


func switch_to_hub_world():
	get_tree().change_scene_to_file("res://Scenes/hub_world.tscn")

func switch_to_pick_a_door():
	get_tree().change_scene_to_file("res://Scenes/pick_a_door.tscn")

func switch_to_event():
	get_tree().change_scene_to_file("res://Scenes/event.tscn")

func spawn_player_hud(sc: String):
	var pl = PLAYER_HUD.instantiate()
	get_tree().root.get_node(sc).add_child(pl)
