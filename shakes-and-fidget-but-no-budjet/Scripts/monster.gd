extends Node2D
class_name Monster

@export var looks: Texture2D   # <-- export the TEXTURE, not the node
@export var health: int = 1

var sound: AudioStream
var damage
var armor
var resistance
var special_ability
var loot

@onready var sprite: Sprite2D = $sprite  # match the actual node name

func _ready() -> void:
	if looks:
		sprite.texture = looks

# Call this to change the texture at runtime
func set_looks(new_texture: Texture2D) -> void:
	looks = new_texture
	sprite.texture = new_texture
