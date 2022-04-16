extends Control

onready var board = get_node("MarginContainer/Board")
onready var HUD = get_node("HUD/")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/Panel/Label.text = ""
	
func _process(delta: float) -> void:
	pass
	


func test():
	Manager.make_quiz()
	Manager.createButton()
