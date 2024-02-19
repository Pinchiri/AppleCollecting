extends KinematicBody2D

export var characterSpeed = 500
var direction = Vector2()
var isCharacterFlipped = true

var applesRecolected = 0

func determineHorizontalMovement(speed, isFlipped, isIdle):
	var animationString = "idle"
	direction.x = speed
	
	if !isIdle:
		animationString = "running"
		$AnimatedSprite.flip_h = isFlipped
		
	$AnimatedSprite.play(animationString)

func _physics_process(delta):
	if	Input.is_key_pressed(KEY_D):
		determineHorizontalMovement( characterSpeed, !isCharacterFlipped, false)
		
	elif Input.is_key_pressed(KEY_A):
		determineHorizontalMovement( -characterSpeed, isCharacterFlipped, false)
		
	else:
		determineHorizontalMovement(0, isCharacterFlipped, true)

	move_and_slide(direction, Vector2.UP)

func _on_collisionCharacterRecolection_area_entered(area):
	applesRecolected += 1
	area.get_parent().queue_free()
	print(applesRecolected)

