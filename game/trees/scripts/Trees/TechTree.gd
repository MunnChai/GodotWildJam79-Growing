class_name TechTree
extends Twee

var point: bool = false

func _ready():
	super._ready()
	
	id = "tech_tree"
	sprite.hframes = 9
	sprite.vframes = 3
	sprite.position.y = -16
	
func _process(delta: float) -> void:
	life_time_seconds += delta
	
	
	if life_time_seconds > time_to_grow:
		if not is_large:
			upgrade_tree()
	
func check_tech_point() -> bool:
	if (!point and life_time_seconds > time_to_grow):
		point = true
		return true
	return false
