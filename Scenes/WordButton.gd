extends Button

class_name WordButton

onready var tween = get_node("Tween")

var current_rect_scale
var xPos
var yPos
var width
var height
var scale_range

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 버튼이 Tree에 추가될 때 Area2D의 위치를 버튼의 중심으로 설정
	width = get_rect().size[0] # WordButton의 width
	height = get_rect().size[1] # WordButton의 height

func _process(delta: float) -> void:
	current_rect_scale = rect_scale

	
func _init(word: String) -> void:
	randomize()
	xPos = rand_range(10, 1260) - len(word) * 10
	yPos = rand_range(10, 520)
	text = word
	set_global_position(Vector2(xPos, yPos))

func _pressed():
	Manager.selected_buttons.append(self)
	Manager.add_text_into_display(text)
	queue_free()

func _on_WordButton_mouse_entered() -> void:
	print("Mouse Entered")
	tween.interpolate_property(self, "rect_size", Vector2(200, 200), Vector2(500, 500), 200, tween.TRANS_BOUNCE, Tween.EASE_OUT)
	

func _on_WordButton_mouse_exited() -> void:
	print("Mouse exited button area")
	if not Rect2(Vector2(), rect_size).has_point(get_local_mouse_position()):
		tween.interpolate_property(self, "rect_scale", Vector2(500, 500), Vector2(200, 200), 2, Tween.TRANS_BACK, Tween.EASE_IN)
	
