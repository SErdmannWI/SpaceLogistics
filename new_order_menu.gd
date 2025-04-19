extends Node2D


@onready var origin_option_button: OptionButton = %OriginOptionButton
@onready var destination_option_button: OptionButton = %DestinationOptionButton
@onready var cargo_choice_option_button: OptionButton = %CargoChoiceOptionButton
@onready var available_ships_option_button: OptionButton = %AvailableShipsOptionButton

@onready var cargo_volume_text_edit: TextEdit = %CargoVolumeTextEdit

@onready var cargo_mass: Label = %CargoMass
@onready var destination_error_label: Label = %DestinationErrorLabel
@onready var cargo_density_label: Label = %CargoDensityLabel


var selected_origin: String = ""
var selected_destination: String = ""

var transparent_color: Color = Color(255.0, 0.0, 0.0, 0.0)
var visible_color: Color = Color(255.0, 0.0, 0.0, 255)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origin_option_button.item_selected.connect(_on_origin_selected)
	destination_option_button.item_selected.connect(_on_destination_selected)
	cargo_choice_option_button.item_selected.connect(_on_cargo_selected)
	cargo_volume_text_edit.text_changed.connect(_on_quantity_entered)
	
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


func _add_cargo_choices() -> void:
	for cargo_type: String in CargoTypes.all_cargo_types:
		cargo_choice_option_button.add_item(cargo_type)
	
	cargo_choice_option_button.selected = -1


func _add_available_ships() -> void:
	for ship_id in Ships.available_ships.keys():
		available_ships_option_button.add_item(Ships.available_ships[ship_id].ship_name)
	
	available_ships_option_button.selected = -1


func _on_origin_selected(index: int) -> void:
	_hide_warnings()
	
	# Check if origin and destination are the same
	if selected_destination == origin_option_button.get_item_text(index):
		_show_warning()
		origin_option_button.selected = -1
		return
	
	selected_origin = origin_option_button.get_item_text(index)
	
	if destination_option_button.selected != -1:
		_calculate_trip_distance()


func _on_destination_selected(index: int) -> void:
	_hide_warnings()
	
	# Check if origin and destination are the same
	if selected_origin == destination_option_button.get_item_text(index):
		_show_warning()
		destination_option_button.selected = -1
		return
	
	selected_destination = destination_option_button.get_item_text(index)
	
	if origin_option_button.selected != -1:
		_calculate_trip_distance()


func _on_cargo_selected(index: int) -> void:
	var selected_cargo_name: String = cargo_choice_option_button.get_item_text(index)
	var selected_cargo: CargoType = CargoTypes.all_cargo_types[selected_cargo_name]
	var selected_cargo_density: float = selected_cargo.kg_per_cubic_meter
	
	cargo_density_label.text = "Cargo Density: " + str(selected_cargo_density) + " kg/m3"
	
	_calculate_mass()


func _on_quantity_entered() -> void:
	if cargo_volume_text_edit.text.is_valid_float():
		_calculate_mass()


func _calculate_trip_distance() -> void:
	var origin: Location = Locations.all_locations[origin_option_button.get_item_text(origin_option_button.selected)]
	var destination: Location = Locations.all_locations[destination_option_button.get_item_text(destination_option_button.selected)]
	
	var distance = origin.location_coord.distance_to(destination.location_coord)
	distance = round(distance)
	var au_equivalent = distance / 30
	print(str(distance))
	print(str(au_equivalent))


func _calculate_trip_time() -> void:
	pass


func _calculate_mass() -> void:
	var index = cargo_choice_option_button.selected
	if cargo_choice_option_button.selected > -1:
		var selected_cargo_name: String = cargo_choice_option_button.get_item_text(index)
		var selected_cargo: CargoType = CargoTypes.all_cargo_types[selected_cargo_name]
		
		var selected_cargo_amount: float = float(cargo_volume_text_edit.text)
		var selected_cargo_density: float = selected_cargo.kg_per_cubic_meter
		var total_mass: float = selected_cargo_amount * selected_cargo_density
		
		cargo_mass.text = str(total_mass) + " kg"


func _hide_warnings() -> void:
	destination_error_label.set("theme_override_colors/font_color", transparent_color)


func _show_warning() -> void:
	destination_error_label.set("theme_override_colors/font_color", visible_color)
