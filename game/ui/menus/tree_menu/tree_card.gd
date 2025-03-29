extends Control

@export var tree_stat: TreeStatResource
@export var water_plus_text: String
@export var sun_plus_text: String
@export var nutrients_plus_text: String
@export var water_min_text: String
@export var sun_min_text: String
@export var nutrients_min_text: String
@export var species_text: String
@export var type: TreeManager.TreeType

@export var texture: Texture2D

@onready var water_plus: Label = $TextureRect/WaterPlus
@onready var sun_plus: Label = $TextureRect/SunPlus
@onready var nutrients_plus: Label = $TextureRect/NutrientsPlus
@onready var water_min: Label = $TextureRect/WaterMin
@onready var sun_min: Label = $TextureRect/SunMin
@onready var nutrients_min: Label = $TextureRect/NutrientsMin
@onready var species: Label = $TextureRect/Species
@onready var cost = $TextureRect/Cost

func _ready() -> void:
	$TextureRect/TextureRect.texture = texture
	
	var net_water = tree_stat.gain.y - tree_stat.maint
	if (net_water > 0):
		water_plus.text = str(int(net_water))
		water_min.text = str(int(0))
	else:
		water_plus.text = str(int(0))
		water_min.text = str(int(abs(net_water)))
	
	sun_plus.text = str(int(tree_stat.gain.z))
	nutrients_plus.text = str(int(tree_stat.gain.x))
	sun_min.text = str(int(0))
	nutrients_min.text = str(int(0))
	species.text = tree_stat.name
	cost.text = "Cost: " + str(tree_stat.cost_to_purchase)

@onready var start_position = $TextureRect.position

func _process(delta: float) -> void:
	if TreeManager.selected_tree_species == type:
		$TextureRect.position = start_position + Vector2.UP * 8.0
	else:
		$TextureRect.position = start_position + Vector2.DOWN * 4.0

func _on_button_pressed() -> void:
	if TreeManager.selected_tree_species != type:
		TreeManager.selected_tree_species = type 
		SfxManager.play_sound_effect("ui_click")


func _on_mouse_entered():
	print("Stuff here")
	InfoBox.get_instance().show_content_for_tree(tree_stat)

func _on_mouse_exited():
	InfoBox.get_instance().hide_content()
