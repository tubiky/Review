extends Control

onready var label = $Panel/Label
signal change_display

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func _on_SubmitButton_pressed() -> void:
	if Manager.answer.strip_edges() == label.text.strip_edges():
		print("You got the answer!")
	else:
		print("You got it wrong!")
	

func _on_ClearButton_pressed() -> void:
	label.text = ""
	Manager.selected_buttons.clear()
	Manager.word_buttons.clear()

func _on_NextButton_pressed() -> void:
	Manager.make_quiz()
	Manager.createButton()
