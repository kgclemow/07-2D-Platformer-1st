extends KinematicBody2D

export var score = 0 

# This script controls movement
const UP = Vector2(0,-1)
var motion = Vector2()
var speed = 400
var gravity = 40
var jump_force = -1000

signal score_changed

func _ready():
	emit_signal("score_changed")



func _physics_process(delta):
	motion.y += gravity #increase y value by 10 acting as gravity
	var move_direction = -int(Input.is_action_pressed("ui_left")) + int (Input.is_action_pressed("ui_right"))
	motion.x = lerp(motion.x, speed * move_direction, 0.2)
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		
	else: 
		motion.x = 0 # all above is movement
		
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = jump_force #jump
	
		if move_direction != 0:
			$Body.scale.x = move_direction #change direction player is facing when moves
	# 
	motion = move_and_slide(motion, UP)


func score_lowered(s):
	score -= s
	print(score)
	emit_signal("score_changed")


func die() -> void:
	PlayerData.deaths += 1
	queue_free()
