extends Node2D

export (Texture) var music_on
export (Texture) var music_off
export (Texture) var sound_on
export (Texture) var sound_off

# Called when the node enters the scene tree for the first time.
func _ready():
	change_buttons()

func _on_Button_pressed():
	randomize()
	if PlayerProgress.current_file["current_day"] > 6:
		var randscene = randi() % 13
		get_tree().change_scene("res://mrt" + str(randscene) + ".tscn")
	else:
		get_tree().change_scene("res://mrtTut0" + str(PlayerProgress.current_file["current_day"]) + ".tscn")
	


func _on_BkgMusicButton_pressed():
	PlayerProgress.current_file["music_playing"] = !PlayerProgress.current_file["music_playing"]
	PlayerProgress.save_game()
	change_buttons()
	
func change_buttons():
	if PlayerProgress.current_file["current_day"] < 2:
		$TextureRect/Button.text = "New Game"
	
	if PlayerProgress.current_file["music_playing"]:
		$TextureRect/BkgMusicButton.texture_normal = music_on
	else:
		$TextureRect/BkgMusicButton.texture_normal = music_off
	if PlayerProgress.current_file["sounds_playing"]:
		$TextureRect/SoundsButton.texture_normal = sound_on
	else:
		$TextureRect/SoundsButton.texture_normal = sound_off
	SoundsMain.is_playing()


func _on_SoundsButton_pressed():
	PlayerProgress.current_file["sounds_playing"] = !PlayerProgress.current_file["sounds_playing"]
	PlayerProgress.save_game()
	change_buttons()

func _on_creditsButton_pressed():
	$Popup.popup()

func _on_ShopButton2_pressed():
	$Stats/Names.text = "Days Worked: " + str(PlayerProgress.current_file["current_day"]) + "\n\nCustomers Served: " + str(PlayerProgress.current_file["customers_served"]) + "\n\nTotal Earned: " + str(PlayerProgress.current_file["total_earned"]) + "\n\nCurrent Wage: " + str(PlayerProgress.current_file["current_wage"])
	$Stats.popup()

func _on_ShopButton_pressed():
	get_tree().change_scene("res://Store.tscn")

func _on_CreditsClose_pressed():
	$Popup.hide()
