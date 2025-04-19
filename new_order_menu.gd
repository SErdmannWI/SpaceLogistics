extends Node2D


@onready var origin_option_button: OptionButton = $VBoxContainer/HBoxContainer/OriginOptionButton
@onready var destination_option_button: OptionButton = $VBoxContainer/HBoxContainer2/DestinationOptionButton
@onready var cargo_choice_option_button: OptionButton = $VBoxContainer/HBoxContainer3/CargoChoiceOptionButton
@onready var available_ships_option_button: OptionButton = $VBoxContainer/HBoxContainer6/AvailableShipsOptionButton

@onready var cargo_volume_text_edit: TextEdit = $VBoxContainer/HBoxContainer4/CargoVolumeTextEdit

@onready var cargo_mass: Label = $VBoxContainer/HBoxContainer5/CargoMass
@onready var origin_error_label: Label = $VBoxContainer/HBoxContainer/OriginErrorLabel
@onready var destination_error_label: Label = $VBoxContainer/HBoxContainer2/DestinationErrorLabel


var selected_origin: String = ""
var selected_destination: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origin_option_button.item_selected.connect(_on_origin_selected)
	destination_option_button.item_selected.connect(_on_destination_selected)
	
	_hide_warnings()
	_add_origins()
	_add_destinations()
	_add_cargo_choices()
	_add_available_ships()


func _add_origins() -> void:
	for origin: String in Locations.all_locations.keys():
		origin_option_button.add_item(origin)
	
	origin_option_button.selected = -1


func _add_destinations() -> void:
	for origin: String in Locations.all_locations.keys():
		destination_option_button.add_item(origin)
	
	destination_option_button.selected = -1


func _on_origin_selected(index: int) -> void:
	print("Origin selected")
	
	_hide_warnings()
	
	if selected_destination == origin_option_button.get_item_text(index):
		print("Origin and destination cannot be the same.")
		origin_error_label.show()
		origin_option_button.selected = -1
		return
	
	selected_origin = origin_option_button.get_item_text(index)


func _on_destination_selected(index: int) -> void:
	print("destination selected")
	
	_hide_warnings()
	
	if selected_origin == destination_option_button.get_item_text(index):
		print("Origin and destination cannot be the same.")
		destination_error_label.show()
		destination_option_button.selected = -1
		return
	
	selected_destination = destination_option_button.get_item_text(index)


func _add_cargo_choices() -> void:
	for cargo_type: String in CargoTypes.all_cargo_types:
		cargo_choice_option_button.add_item(cargo_type)
	
	cargo_choice_option_button.selected = -1


func _calculate_mass() -> void:
	pass


func _add_available_ships() -> void:
	for ship_id in Ships.available_ships.keys():
		available_ships_option_button.add_item(Ships.available_ships[ship_id].ship_name)
	
	available_ships_option_button.selected = -1


func _hide_warnings() -> void:
	origin_error_label.hide()
	destination_error_label.hide()
