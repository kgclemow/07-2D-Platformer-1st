extends KinematicBody2D

export var score = 10
export var fire_probability = 0.5

onready var Fire = load("res://Scenes/Fire.tscn")

var ready = false

func _ready():
	randomize()

func _physics_process(delta):
	if ready:
		$Tween.start()
		ready = false
	
func _on_Timer_timeout():
	if randf() < fire_probability:
		var b = Fire.instance()
		b.position = position
		b.position.x -= 40
		get_node("/root/Level/Fire").add_child(b)


func die() -> void:
	PlayerData.score += score
	queue_free()
