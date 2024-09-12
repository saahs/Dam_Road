extends CharacterBody2D

var speed = 300
var player = null
var player_chase = false
var spritedir = "none"
	


func _physics_process(_delta):

	if player_chase:
		position += (player.position - position)/speed

		
		
	
		
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	
func _moving_direction(_delta):
	var dir = player.position - position
	
	if dir.x > 0.1 and dir.y > 0.1:
		spritedir = "rightdown"
		print("ggg")
		$AnimatedSprite2D.play("walk_rd")
	elif dir.x > 0.1 and dir.y > 0.0:
		spritedir = "up"
		print("ggg")
		$AnimatedSprite2D.play("walk_u")
	else:
		$AnimatedSprite2D.play("idle_rd")







