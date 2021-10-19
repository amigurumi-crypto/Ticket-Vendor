extends Node2D

onready var usable = PlayerProgress.current_file["cash_in_hand"]
onready var food = PlayerProgress.current_file["grocery_bought"]
onready var rent = PlayerProgress.current_file["rent_paid"]
var week
var month
var dropdown = 0
var housedropdown = 0
onready var localPhone = PlayerProgress.current_file["local_smartphone"]
onready var importPhone = PlayerProgress.current_file["imported_smartphone"]

func _ready():
	var day = PlayerProgress.current_file["current_day"]
	week = int((day/7) + 1) 
	month = int((week/4) + 1)
	$TextureRect/Day.text = "Currently:\nMonth "+ str(month) + " - Week " + str(week) + "\nDay " + str(day)
	refresh()
	

func refresh():
	$TextureRect/Label.text = "Cash: " + str(usable)
	$TextureRect/GroceryLabel.text = "Groceries for\nweek " + str(food + 1)
	if food > (week + 1):
		$TextureRect/GroceryButton.disabled = true
	$TextureRect/RentLabel.text = "rent for\nmonth " + str(rent + 1)
	if rent > (month + 1):
		$TextureRect/RentButton.disabled = true
	$TextureRect/OptionButton.set_item_text(0, "local v" + str(localPhone + 1 ))
	$TextureRect/OptionButton.set_item_text(1, "imported v" + str(importPhone + 1 ))
	var localcost = 8845 + 1103 * (localPhone + 1)
	var impCost = 44225 + 5515 * (importPhone + 1)
	if dropdown == 0:
		$TextureRect/CostButton.text = str(localcost)
	elif dropdown == 1:
		$TextureRect/CostButton.text = str(impCost)


func _on_TextureButton_pressed():
	PlayerProgress.current_file["cash_in_hand"] = usable
	PlayerProgress.current_file["grocery_bought"] = food
	PlayerProgress.current_file["rent_paid"] = rent
	PlayerProgress.current_file["local_smartphone"] = localPhone
	PlayerProgress.current_file["imported_smartphone"] = importPhone
	PlayerProgress.save_game()
	get_tree().change_scene("res://Home.tscn")


func _on_OptionButton_item_selected(id):
	dropdown = id
	refresh()

func _on_CostButton_pressed():
	if (usable - int($TextureRect/CostButton.text)) >= 0:
		usable -= int($TextureRect/CostButton.text)
		if dropdown == 0:
			localPhone += 1
		else:
			importPhone += 1
		refresh()

func _on_GroceryButton_pressed():
	if (usable - 600) > 0:
		usable -= 600
		food += 1
		refresh()


func _on_HouseOptionButton_item_selected(id):
	if id == 0:
		$TextureRect/RentButton.text = "1500"
	elif id == 1:
		$TextureRect/RentButton.text = "2500"
	elif id == 2:
		$TextureRect/RentButton.text = "7500"
	elif id == 3:
		$TextureRect/RentButton.text = "15000"
	

func _on_RentButton_pressed():
	if (usable - int($TextureRect/RentButton.text)) >= 0:
		usable -= int($TextureRect/RentButton.text)
		rent += 1
		refresh()
