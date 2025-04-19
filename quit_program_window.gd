extends Window

signal quit_program

@onready var quit_program_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/QuitProgramButton
@onready var cancel_quit_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/CancelQuitButton


func _ready() -> void:
	add_theme_icon_override("close", Texture2D.new()) # Hides the "X" button
	quit_program_button.pressed.connect(_quit_program_button_pressed)
	cancel_quit_button.pressed.connect(_cancel_quit_button_pressed)


func _quit_program_button_pressed() -> void:
	quit_program.emit()


func _cancel_quit_button_pressed() -> void:
	visible = false
