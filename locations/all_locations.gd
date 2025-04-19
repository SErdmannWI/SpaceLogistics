extends Node


var all_locations: Dictionary = {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_add_all_locations()


func _add_all_locations() -> void:
	var mercury: Location = Location.new(Constants.MERCURY_NAME, Constants.MERCURY_COORDS, Constants.MERCURY_UNLOAD_TIME)
	var venus: Location = Location.new(Constants.VENUS_NAME, Constants.VENUS_COORDS, Constants.VENUS_UNLOAD_TIME)
	var earth: Location = Location.new(Constants.EARTH_NAME, Constants.EARTH_COORDS, Constants.EARTH_UNLOAD_TIME)
	var mars: Location = Location.new(Constants.MARS_NAME, Constants.MARS_COORDS, Constants.MARS_UNLOAD_TIME)
	var jupiter: Location = Location.new(Constants.JUPITER_NAME, Constants.JUPITER_COORDS, Constants.JUPITER_UNLOAD_TIME)
	var saturn: Location = Location.new(Constants.SATURN_NAME, Constants.SATURN_COORDS, Constants.SATURN_UNLOAD_TIME)
	var uranus: Location = Location.new(Constants.URANUS_NAME, Constants.URANUS_COORDS, Constants.URANUS_UNLOAD_TIME)
	var neptune: Location = Location.new(Constants.NEPTUNE_NAME, Constants.NEPTUNE_COORDS, Constants.NEPTUNE_UNLOAD_TIME)
	
	all_locations[Constants.MERCURY_NAME] = mercury
	all_locations[Constants.VENUS_NAME] = venus
	all_locations[Constants.EARTH_NAME] = earth
	all_locations[Constants.MARS_NAME] = mars
	all_locations[Constants.JUPITER_NAME] = jupiter
	all_locations[Constants.SATURN_NAME] = saturn
	all_locations[Constants.URANUS_NAME] = uranus
	all_locations[Constants.NEPTUNE_NAME] = neptune
