extends Area2D

class_name WordButton_2

var xPos
var yPos
var collsionRect := CollisionShape2D
var label := Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Need to set the size of CollisionShape2D in Ready Function
	pass
	
func _init(txt: String):
	randomize()
	xPos = rand_range(0, 1260)
	yPos = rand_range(0, 620)
	set_global_position(Vector2(xPos, yPos))
	var label = $ButtonLabel
	var collisionRect = $CollisionShape2D
	
