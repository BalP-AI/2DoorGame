extends Node

var door_types : Dictionary = {
"Monster":["res://Graphics/Doors/Monster/Type_1/","res://Graphics/Doors/Monster/Type_2/"],
"Trap":["res://Graphics/Doors/Trap/Type_1/","res://Graphics/Doors/Trap/Type_2/"],
"Loot":["res://Graphics/Doors/Loot/Type_1/","res://Graphics/Doors/Loot/Type_2/"],
"Empty":["res://Graphics/Doors/Empty/Type_1/","res://Graphics/Doors/Empty/Type_2/"]
} 
var door_1_type
var door_2_type

var door_1_select : bool 
var door_2_select : bool 

func getSelectedDoorType() -> String:
	if GlobalDoorPicker.door_1_select :
		return GlobalDoorPicker.door_1_type
	else:
		return GlobalDoorPicker.door_2_type
