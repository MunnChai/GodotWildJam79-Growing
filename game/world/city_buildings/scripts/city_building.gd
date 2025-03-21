class_name CityBuilding
extends Structure

const NUM_BUILDINGS = 6

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	var atlas_texture: AtlasTexture = sprite_2d.texture
	choose_random_sprite()

func choose_random_sprite():
	var atlas_texture: AtlasTexture = sprite_2d.texture.duplicate()
	
	var rand = randi_range(0, NUM_BUILDINGS - 1)
	if (rand == 2):
		rand = 3
	
	atlas_texture.region.position.x += 32 * rand
	
	if (randf() > 0.5):
		sprite_2d.flip_h = true
	
	sprite_2d.texture = atlas_texture
