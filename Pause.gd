extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$PauseBox.hide()


func _on_HomeButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Home.tscn")


func _on_ContinueButton_pressed():
	get_tree().paused = false
	$PauseBox.hide()
	
func _on_PauseButton_pressed():
	$PauseBox.show()
