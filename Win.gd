extends CanvasLayer

export (String) var nextStage

func _ready():
	$PauseBox.hide()


func _on_HomeButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Home.tscn")


func _on_NextButton_pressed():
	if nextStage:
		get_tree().change_scene(nextStage)
	else:
		var randscene = randi() % 13
		get_tree().change_scene("res://mrt" + str(randscene) + ".tscn")


func _on_not_grid_end_panel(servedtoday, mistakes, earned):
	$PauseBox.show()
	$PauseBox/shiftEnd2.text = "Customers served\ntoday: " + str(servedtoday)
	$PauseBox/shiftEnd3.text = "Cost of mistakes: " + str(mistakes)
	$PauseBox/shiftEnd4.text = "Take home pay:\n" + str(earned)
