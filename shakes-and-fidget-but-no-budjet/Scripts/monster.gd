extends Node2D
class_name Monster


@export var health: int = 1

@onready var sprite: AnimatedSprite2D = $sprite
@onready var anim_player: AnimationPlayer = $sprite/AnimationPlayer
@onready var button: TextureButton = $Button


var sound: AudioStream
var damage
var armor
var resistance
var special_ability
var loot
var monster_name


var present_names : Array[String]

func _ready() -> void:
	set_present_animation_list()
	set_monster_name()
	sprite.play(monster_name + "_Present")

func set_present_animation_list() -> void:
	var animations = sprite.sprite_frames.get_animation_names()
	for anim in animations:
		if anim.ends_with("Present"):
			present_names.append(anim)


func set_monster_name():
	monster_name = present_names.pick_random().split("_").get(0)
	print(monster_name)


func _on_sprite_animation_finished() -> void:
	sprite.play(monster_name + "_Idle")
	button.disabled = false


func _on_button_mouse_entered() -> void:
	print(get_global_mouse_position())


func _on_button_pressed() -> void:
	anim_player.play("fight")
	await anim_player.animation_finished
	anim_player.play("RESET")
