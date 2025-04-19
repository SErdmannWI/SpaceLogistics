class_name Ship
extends Node


var id: String
var ship_name: String
var cargo_capacity_mass: float
var cargo_capacity_volume: float
var speed: float

func _init(id: String, ship_name: String, cargo_capacity_mass: float, cargo_capacity_volume: float, speed: float) -> void:
	self.id = id
	self.ship_name = ship_name
	self.cargo_capacity_mass = cargo_capacity_mass
	self.cargo_capacity_volume = cargo_capacity_volume
	self.speed = speed
