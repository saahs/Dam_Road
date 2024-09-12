extends CharacterBody2D

var speed = 200
var player = null
var player_chase = false
var spritedir = "none"



func _ready():
	$B_Used1.play("idle_d")




func play_anim(movement):
	var anim = $B_Used1
	
	if spritedir == "right":
		if movement == 1:
			anim.play("walk_r")
		elif movement == 0:
			anim.play("idle_r")
			
	if spritedir == "left":
		if movement == 1:
			anim.play("walk_l")
		elif movement == 0:
			anim.play("idle_l")
			
	if spritedir == "down":
		if movement == 1:
			anim.play("walk_d")
		elif movement == 0:
			anim.play("idle_d")
			
	if spritedir == "up":
		if movement == 1:
			anim.play("walk_u")
		elif movement == 0:
			anim.play("idle_u")
			
	if spritedir == "leftdown":
		if movement == 1:
			anim.play("walk_ld")
		elif movement == 0:
			anim.play("idle_ld")
			
	if spritedir == "rightdown":
		if movement == 1:
			anim.play("walk_rd")
		elif movement == 0:
			anim.play("idle_rd")
	
	if spritedir == "rightup":
		if movement == 1:
			anim.play("walk_ru")
		elif movement == 0:
			anim.play("walk_ru")

	if spritedir == "leftup":
		if movement == 1:
			anim.play("walk_lu")
		elif movement == 0:
			anim.play("idle_lu")
	

func _physics_process(delta):



	if player_chase:
		position += (player.position - position).normalized() * speed * delta
		
		if(player.position.x - position.x) > 0 and (player.position.y - position.y) > 0:
			print("she runs rightdown!")
			spritedir == "rightdown"
			$B_Used1.play("walk_rd")
		elif(player.position.x - position.x) < 0 and (player.position.y - position.y) < 0:
			print("she runs leftup!")
			spritedir == "leftup"
			$B_Used1.play("walk_lu")
		elif(player.position.x - position.x) > 0 and (player.position.y - position.y) < 0:
			print("she runs rightup")
			spritedir == "rightup"
			$B_Used1.play("walk_ru")
		elif(player.position.x - position.x) < 0 and (player.position.y - position.y) > 0:
			print("she runs leftdown")
			spritedir == "leftdown"
			$B_Used1.play("walk_ld")
		elif(player.position.x - position.x) < 0 and (player.position.y - position.y) == 0:
			print("she runs left")
			spritedir == "left"
			$B_Used1.play("walk_l")
		elif(player.position.x - position.x) > 0 and (player.position.y - position.y) == 0:
			print("she runs right")
			spritedir == "right"
		elif(player.position.x - position.x) == 0 and (player.position.y - position.y) > 0:
			print("she runs down")
			spritedir == "down"
			$B_Used1.play("walk_d")
		elif(player.position.x - position.x) == 0 and (player.position.y - position.y) < 0:
			print("she runs up")
			spritedir == "up"
			$B_Used1.play("walk_u")
	
		
		move_and_collide(Vector2(0,0))

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	
	
	
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	
	

