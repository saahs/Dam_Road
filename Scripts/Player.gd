extends CharacterBody2D


const speed = 680.0
var dir = "none"

func _ready():
	$AnimatedSprite2D.play("idle_d")

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(_delta):
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
		dir = "rightup"
		play_anim(1)
		velocity.x = speed / 1.2
		velocity.y = -speed / 2
	elif Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
		dir = "leftup"
		play_anim(1)
		velocity.x = -speed / 1.2
		velocity.y = -speed / 2
	elif Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
		dir = "leftdown"
		play_anim(1)
		velocity.x = -speed / 1.2
		velocity.y = speed / 2
	elif Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
		dir = "rightdown"
		play_anim(1)
		velocity.x = speed / 1.2
		velocity.y = speed / 2
	elif Input.is_action_pressed("ui_left"):
		dir = "left"
		play_anim(1)
		velocity.x = -speed / 0.8
		velocity.y = 0
	elif Input.is_action_pressed("ui_right"):
		dir = "right"
		play_anim(1)
		velocity.x = speed / 0.8
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed / 1.7
	elif Input.is_action_pressed("ui_down"):
		dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed / 1.7
	
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var adir = dir
	var anim = $AnimatedSprite2D
	
	if adir == "right":
		if movement == 1:
			anim.play("run_r")
		elif movement == 0:
			anim.play("idle_r")
			
	if adir == "left":
		if movement == 1:
			anim.play("run_l")
		elif movement == 0:
			anim.play("idle_l")
			
	if adir == "down":
		if movement == 1:
			anim.play("run_d")
		elif movement == 0:
			anim.play("idle_d")
			
	if adir == "up":
		if movement == 1:
			anim.play("run_u")
		elif movement == 0:
			anim.play("idle_u")
			
	if adir == "leftdown":
		if movement == 1:
			anim.play("run_ld")
		elif movement == 0:
			anim.play("idle_ld")
			
	if adir == "rightdown":
		if movement == 1:
			anim.play("run_rd")
		elif movement == 0:
			anim.play("idle_rd")
	
	if adir == "rightup":
		if movement == 1:
			anim.play("run_ru")
		elif movement == 0:
			anim.play("idle_ru")

	if adir == "leftup":
		if movement == 1:
			anim.play("run_lu")
		elif movement == 0:
			anim.play("idle_lu")
	
	
