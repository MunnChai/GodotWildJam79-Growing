extends Node

var tree_plant: AudioStreamPlayer
const TREE_PLANT = preload("res://sound/sfx/AudioPlayers/tree_plant.tscn")
var gun_tree_projectile: AudioStreamPlayer
const GUN_TREE_PROJECTILE = preload("res://sound/sfx/AudioPlayers/gun_tree_projectile.tscn")
var tree_damage: AudioStreamPlayer
const TREE_DAMAGE = preload("res://sound/sfx/AudioPlayers/tree_damage.tscn")
var speedle_die: AudioStreamPlayer
const SPEEDLE_DIE = preload("res://sound/sfx/AudioPlayers/speedle_die.tscn")
var tree_remove: AudioStreamPlayer
const TREE_REMOVE = preload("res://sound/sfx/AudioPlayers/tree_remove.tscn")
<<<<<<< Updated upstream
=======
var ui_fail: AudioStreamPlayer
const UI_FAIL = preload("res://sound/sfx/AudioPlayers/ui_fail.tscn")
var ui_click: AudioStreamPlayer
const UI_CLICK = preload("res://sound/sfx/AudioPlayers/ui_click.tscn")
var concrete_break: AudioStreamPlayer
const CONCRETE_BREAK = preload("res://sound/sfx/AudioPlayers/concrete_break.tscn")
var ui_pages: AudioStreamPlayer
const UI_PAGES = preload("res://sound/sfx/AudioPlayers/ui_pages.tscn")
var silk_spitter_die: AudioStreamPlayer
const SILK_SPITTER_DIE = preload("res://sound/sfx/AudioPlayers/silk_spitter_die.tscn")
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

var SFX_DICT: Dictionary[String, AudioStreamPlayer]  

func _ready() -> void:
	#tree_plant sfx
	tree_plant = TREE_PLANT.instantiate()
	add_child(tree_plant)
	SFX_DICT["tree_plant"] = tree_plant
	
	#gun_tree_projectile sfx
	gun_tree_projectile = GUN_TREE_PROJECTILE.instantiate()
	add_child(gun_tree_projectile)
	SFX_DICT["gun_tree_projectile"] = gun_tree_projectile
	
	#tree_damage sfx
	tree_damage = TREE_DAMAGE.instantiate()
	add_child(tree_damage)
	SFX_DICT["tree_damage"] = tree_damage
	
	#speedle_die sfx
	speedle_die = SPEEDLE_DIE.instantiate()
	add_child(speedle_die)
	SFX_DICT["speedle_die"] = speedle_die
	
	#tree_remove sfx
	tree_remove = TREE_REMOVE.instantiate()
	add_child(tree_remove)
	SFX_DICT["tree_remove"] = tree_remove
	
<<<<<<< Updated upstream
=======
	#ui_fail sfx
	ui_fail = UI_FAIL.instantiate()
	add_child(ui_fail)
	SFX_DICT["ui_fail"] = ui_fail
	
	#ui_click sfx
	ui_click = UI_CLICK.instantiate()
	add_child(ui_click)
	SFX_DICT["ui_click"] = ui_click
	
	#concrete break sfx
	concrete_break = CONCRETE_BREAK.instantiate()
	add_child(concrete_break)
	SFX_DICT["concrete_break"] = concrete_break
	
	# ui_pages sfx
	ui_pages = UI_PAGES.instantiate()
	add_child(ui_pages)
	SFX_DICT["ui_pages"] = ui_pages
	
	# ui_pages sfx
	silk_spitter_die = SILK_SPITTER_DIE.instantiate()
	add_child(ui_pages)
	SFX_DICT["silk_spitter_die"] = silk_spitter_die
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

func play_sound_effect(name: String) -> void:
	var sound_effect: AudioStreamPlayer = SFX_DICT[name]
	if (sound_effect != null): 
		sound_effect.playing = true
