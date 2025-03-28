class_name BuildingMap
extends TileMapLayer

const SOURCE_ID: int = 1

var tile_scene_map: Dictionary[Vector2i, Node2D]

const COST_TO_REMOVE_CITY_TILE: int = 100
const COST_TO_REMOVE_ROAD_TILE: int = 250

func _ready() -> void:
	add_to_group("structure_map")
	y_sort_enabled = true

func add_structure(map_coords: Vector2i, structure: Structure) -> bool:
	if (tile_scene_map.has(map_coords)):
		# Check if it is a decor structure
		var curr_structure: Structure = tile_scene_map[map_coords]
		if (!curr_structure.id.ends_with("decor")): # If it is not decor, you CANT BUILD HERE!
			return false
		# Otherwise, destroy the decor and continue
		remove_structure(map_coords)
	
	structure.position = map_to_local(map_coords)
	
	tile_scene_map[map_coords] = structure
	add_child(structure)
	return true

# Remove the node at the given map coordinates
# Returns true upon success, false if there is no node at the map coords
func remove_structure(map_coords: Vector2i) -> bool:
	if (!tile_scene_map.has(map_coords)):
		return false
	
	var object: Node2D = tile_scene_map[map_coords]
	
	# Munn: kinda temp fix? twees handle freeing themselves, so we only need to free stuff like 
	#       buildings, decor, etc.
	if (not object is Twee):
		remove_child(object)
	
	tile_scene_map.erase(map_coords)
	return true

func get_building_node(pos: Vector2i) -> Node2D:
	return tile_scene_map.get(pos)

func get_mouse_coords() -> Vector2:
	var mouse_screen_pos: Vector2 = get_local_mouse_position()
	
	return mouse_screen_pos

# Returns true if the position has an obstructive structure on it (structures that aren't decor)
func does_obstructive_structure_exist(map_pos: Vector2i) -> bool:
	if (!tile_scene_map.has(map_pos)):
		return false
	
	var object: Structure = tile_scene_map[map_pos]
	
	return !object.id.ends_with("decor")
	
