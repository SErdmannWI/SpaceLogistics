extends Node


var available_ships: Dictionary = {}


func _init() -> void:
	_initialize_ships()


func _initialize_ships() -> void:
	var bon_voyage: Ship = Ship.new(Constants.BON_VOYAGE_ID, Constants.BON_VOYAGE_NAME, Constants.BON_VOYAGE_MASS,
		Constants.BON_VOYAGE_VOLUME, Constants.BON_VOYAGE_SPEED)
	available_ships[Constants.BON_VOYAGE_ID] = bon_voyage
	
	var starlifter: Ship = Ship.new(Constants.STARLIFTER_ID, Constants.STARLIFTER_NAME, Constants.STARLIFTER_MASS,
		Constants.STARLIFTER_VOLUME, Constants.STARLIFTER_SPEED)
	available_ships[Constants.STARLIFTER_ID] = starlifter

	var voidrunner: Ship = Ship.new(Constants.VOIDRUNNER_ID, Constants.VOIDRUNNER_NAME, Constants.VOIDRUNNER_MASS,
		Constants.VOIDRUNNER_VOLUME, Constants.VOIDRUNNER_SPEED)
	available_ships[Constants.VOIDRUNNER_ID] = voidrunner

	var solaris: Ship = Ship.new(Constants.SOLARIS_ID, Constants.SOLARIS_NAME, Constants.SOLARIS_MASS,
		Constants.SOLARIS_VOLUME, Constants.SOLARIS_SPEED)
	available_ships[Constants.SOLARIS_ID] = solaris

	var emberwing: Ship = Ship.new(Constants.EMBERWING_ID, Constants.EMBERWING_NAME, Constants.EMBERWING_MASS,
		Constants.EMBERWING_VOLUME, Constants.EMBERWING_SPEED)
	available_ships[Constants.EMBERWING_ID] = emberwing
