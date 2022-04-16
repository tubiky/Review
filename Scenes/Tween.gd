extends Tween

onready var word_button = get_node("WordButton")

func scale_button_size():
	interpolate_property(word_button, "rect_scale.x", 1, 3, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	start()
