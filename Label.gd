extends Label

export var start_time = 60
var current_time

signal shift_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(start_time)
	current_time = start_time
	$TextureProgress.max_value = start_time


func _on_Timer_timeout():
	if current_time > 0:
		current_time -= 1
		$TextureProgress.value += 1
		self.text = str(current_time)
		if current_time == 0:
			emit_signal("shift_over")
	
func _on_Tutorial_tut_end():
	$Timer.start()
