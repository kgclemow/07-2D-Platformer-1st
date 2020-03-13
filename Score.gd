extends Node

func _ready():
	pass

func _on_Player_score_changed():
	var s = get_node("/root/Game/Player").score
	$Score.text = "Score: " + str(s)


func _on_Player_score_lowered():
	var d = get_node("/root/Game/Player").score
	$Score.text = "Score: " + str(d)
