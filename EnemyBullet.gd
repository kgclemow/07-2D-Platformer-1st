extends RigidBody2D

export var speed = 10
export var score = -1
onready var Player = get_node("/root/Game/Player")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.get_node("/root/Game/Player"):
			Player.score_lowered(c.score)
		queue_free()

	if position.y > get_viewport_rect().size.y + 10:
		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,speed))
	state.set_angular_velocity(0)


func _on_Timer_timeout():
	pass # Replace with function body.
