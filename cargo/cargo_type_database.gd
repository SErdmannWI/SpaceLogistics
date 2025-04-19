extends Node


var all_cargo_types: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_add_cargo_types()


func _add_cargo_types() -> void:
	var liquid_oxygen: CargoType = CargoType.new(Constants.OXYGEN_NAME, "Breathable air in liquid form", Constants.OXYGEN_DENSITY)
	var soil: CargoType = CargoType.new(Constants.SOIL_NAME, "Fertile soil for planting crops", Constants.SOIL_DENSITY)
	var liquid_nitrogen: CargoType = CargoType.new(Constants.NITROGEN_NAME, "Nitrogen in liquid form.", Constants.NITROGEN_DENSITY)
	var water: CargoType = CargoType.new(Constants.WATER_NAME, "Potable water", Constants.WATER_DENSITY)
	var lithium: CargoType = CargoType.new(Constants.LITHIUM_NAME, "Valuable alkali metal.", Constants.LITHIUM_DENSITY)
	var sausage: CargoType = CargoType.new(Constants.SAUSAGE_NAME, "Preserved, salted meat", Constants.SAUSAGE_DENSITY)
	var platium: CargoType = CargoType.new(Constants.PLATINUM_NAME, "Valuable metal", Constants.PLATINUM_DENSITY)
	var rare_crystals: CargoType = CargoType.new(Constants.CRYSTAL_NAME, "Exotic crystals for medicinal use only.", Constants.CRYSTAL_DENSITY)
	
	all_cargo_types[Constants.OXYGEN_NAME] = liquid_oxygen
	all_cargo_types[Constants.SOIL_NAME] = soil
	all_cargo_types[Constants.NITROGEN_NAME] = liquid_nitrogen
	all_cargo_types[Constants.WATER_NAME] = water
	all_cargo_types[Constants.LITHIUM_NAME] = lithium
	all_cargo_types[Constants.SAUSAGE_NAME] = sausage
	all_cargo_types[Constants.PLATINUM_NAME] = platium
	all_cargo_types[Constants.CRYSTAL_NAME] = rare_crystals
