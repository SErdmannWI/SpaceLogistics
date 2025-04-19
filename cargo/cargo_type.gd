class_name CargoType
extends Resource

@export var cargo_name: String
@export var cargo_description: String
@export var kg_per_cubic_meter: float


func _init(name: String, description: String, density: float) -> void:
	cargo_name = name
	cargo_description = description
	kg_per_cubic_meter = density
