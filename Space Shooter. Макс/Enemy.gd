extends Area2D

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 20
export(int) var ARMOR = 3

var mob_types = ["one", "two", "three", "four"]

func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _process(delta):
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body):
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		var main = get_tree().current_scene
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var explosionEffect = ExplosionEffect.instance()
	main.score -= 2
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position
	if (main.score<=0):
		main.scoreLabel.text = "You win"
