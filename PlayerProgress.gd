extends Node

var start_file = {
	"customers_served": 0,
	"current_day": 1,
	"music_playing": true,
	"sounds_playing": true,
	"current_wage": 490,
	"cash_in_hand": 0,
	"total_earned": 0,
	"grocery_bought": 1,
	"rent_paid": 1,
	"local_smartphone": 0,
	"imported_smartphone": 0
}
var current_file = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	current_file = load_game()
#	current_file = start_file
#	save_game()

func save_game():
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_var(current_file)
	file.close()

func load_game():
	var file = File.new()
	if !file.file_exists("user://save_game.dat"):
		current_file = start_file
		save_game()
	file.open("user://save_game.dat", File.READ)
	var content = file.get_var()
	file.close()
	return content
