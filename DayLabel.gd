extends Label

var days = [
	"Sun",
	"Mon",
	"Tue",
	"Wed",
	"Thu",
	"Fri",
	"Sat"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_day()

func set_day():
	var today = PlayerProgress.current_file["current_day"] % 7
	self.text = days[today]

