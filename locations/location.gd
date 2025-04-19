class_name Location
extends Node

var location_name: String
var location_coord: Vector2
var unload_time: int


func _init(location_name: String, coordinates: Vector2, unload_time: int) -> void:
	self.location_name = location_name
	self.location_coord = coordinates
	self.unload_time = unload_time
