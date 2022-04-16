extends Node

onready var main = get_node("/root/Main")
onready var board = get_node("/root/Main/MarginContainer/Board")
onready var marginContainter = get_node("/root/Main/MarginContainer/")
onready var HUD_Label = get_node("/root/Main/HUD/Panel/Label/")


var quiz = Array()
var selected_buttons = Array()
var word_buttons = Array()
var answer

# Signal: If there has been any change in selected_buttons
# or word_buttons, emit signal so that re-draw all the buttons of word_buttons


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func make_quiz():
	if quiz.size() <= 0:
		for word in Data.sentences[0]["sentence"].split(" "):
			quiz.append(word.strip_edges())
	answer = Data.sentences[0]["sentence"]
	
func createButton():
	for i in quiz:
		word_buttons.append(WordButton.new(i))
	
	for i in range(word_buttons.size()):
		board.add_child(word_buttons.pop_back())

# Main/HUD/Panel/Label에 버튼의 text를 추가하기
func add_text_into_display(txt: String):
	var sep = " "
	if HUD_Label.text == "":
		HUD_Label.text += txt
	else:
		HUD_Label.text += (sep+txt)
		
func check_answer():
	pass
	
# Pop the last button in selected_buttons and append into word_buttons
# Get rid of the last word in Display of HUD
func undo():
	if selected_buttons.size() > 0:
		var last_chosen_button = selected_buttons.pop()
		word_buttons.append(last_chosen_button)
		board.add_child(word_buttons[-1])
	else:
		print("There is no word button selected!")

