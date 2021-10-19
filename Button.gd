extends Button

export(int) var value = 1

#self.text = str(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	print(value)
