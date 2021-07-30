extends KinematicBody2D

func _ready():
	pass

func _physics_process(delta):
	var move_direction = Vector2(0,0)
	var key_up = Input.is_action_pressed("ui_up")
	var key_down = Input.is_action_pressed("ui_down")
	var key_left = Input.is_action_pressed("ui_left")
	var key_right = Input.is_action_pressed("ui_right")
	
	if(key_up):
		move_direction.y = -PlayerVar.speed
	if(key_down):
		move_direction.y = PlayerVar.speed
	if(key_left):
		move_direction.x = -PlayerVar.speed
	if(key_right):
		move_direction.x = PlayerVar.speed
		
	move_and_collide(move_direction)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				if $Camera2D.zoom > Vector2(0.5, 0.5):
					$Camera2D.zoom = $Camera2D.zoom - Vector2(0.1, 0.1)
			elif event.button_index == BUTTON_WHEEL_DOWN:
				if $Camera2D.zoom < Vector2(1, 1):
					$Camera2D.zoom = $Camera2D.zoom + Vector2(0.1, 0.1)
