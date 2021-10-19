extends Node

var soundeffects = [
	preload("res://Match 3 Assets/sounds/cardPlace2.ogg"),
	preload("res://Match 3 Assets/sounds/cardShove4.ogg"),
	preload("res://Match 3 Assets/sounds/chipLay1.ogg"),
	preload("res://Match 3 Assets/sounds/confirmation_002.ogg"),
	preload("res://Match 3 Assets/sounds/error_002.ogg")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	is_playing()

func is_playing():
	if PlayerProgress.current_file["music_playing"]:
		if $BackgroundMusic.playing == true:
			return
		$BackgroundMusic.play()
	else:
		$BackgroundMusic.stop()

func play_effects(which):
	if PlayerProgress.current_file["sounds_playing"]:
		$SoundEffects.stream = soundeffects[which]
		$SoundEffects.play()
