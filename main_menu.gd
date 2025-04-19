extends Node2D

@onready var new_session_button: Button = $CanvasLayer/MainButtonVBox/NewSessionButton
@onready var load_session_button: Button = $CanvasLayer/MainButtonVBox/LoadSessionButton
@onready var settings_button: Button = $CanvasLayer/MainButtonVBox/SettingsButton
@onready var quit_button: Button = $CanvasLayer/MainButtonVBox/QuitButton
@onready var quit_program_window: Window = $CanvasLayer/MarginContainer/QuitProgramWindow


func _ready() -> void:
	new_session_button.pressed.connect(_on_new_session_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	
	quit_program_window.quit_program.connect(_on_quit)
	quit_program_window.visible = false


func _on_new_session_button_pressed() -> void:
	get_tree().change_scene_to_file(Constants.PATH_NEW_SESSION)


func _on_load_session_button_pressed() -> void:
	pass


func _on_settings_button_pressed() -> void:
	pass


func _on_quit_button_pressed() -> void:
	quit_program_window.show()
	quit_program_window.grab_focus()


func _on_quit() -> void:
	get_tree().quit()
