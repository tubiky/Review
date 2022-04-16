extends Area2D

onready var button = get_parent()

var shape = RectangleShape2D.new()
var collision = CollisionShape2D.new()

func _ready() -> void:
	position.x = button.xPos + button.width/2
	position.y = button.yPos + button.height/2
	
	
	shape.set_extents(Vector2(button.width/2, button.height/2))
	collision.add_shape(shape)
	
	add_child(collision)
