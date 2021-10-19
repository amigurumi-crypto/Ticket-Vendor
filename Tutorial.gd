extends Node2D

var page = 1
onready var finger = $Pointer

signal tut_end

export (Array, String, MULTILINE) var dialog = [
	"Hello, Welcome\nto your first\nday",
	"This is your\nworkstation",
	"The list of\ndestinations and\nfares can be\nseen here" 
	
]

export (PoolVector2Array) var places = [
	Vector2(152,408),
	Vector2(202,468),
	Vector2(152,408),
]

onready var max_pages = dialog.size()

func _ready():
	turn_page()
	point_effect()
	pass # Replace with function body.

func turn_page():
	$TutorialBox/TutorialLabel.text = dialog[page - 1]
	$TutorialBox/TutorialLabel2.text = str(page) + "/" + str(max_pages)
	finger.position = places[page-1]

func point_effect():
	var mover = $Pointer/PointerTween
	mover.interpolate_property(finger, "scale", Vector2(0.8, 0.8), Vector2(1.5, 1.5), .4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	mover.start()

func _on_LeftButton_pressed():
	if page > 1:
		page -= 1
		turn_page()
		$TutorialBox/StartButton.hide()
		$TutorialBox/RightButton.show()

func _on_RightButton_pressed():
	page += 1
	turn_page()
	if page == max_pages:
		$TutorialBox/StartButton.show()
		$TutorialBox/RightButton.hide()

func _on_StartButton_pressed():
	emit_signal("tut_end")
	self.hide()
