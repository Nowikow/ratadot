extends Node

var score = 100 setget set_score

onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	scoreLabel.text = "Debt of Ratabor  = " + str(score) + "%"
