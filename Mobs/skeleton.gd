extends CharacterBody2D

var chase = false
var speed = 100
@onready var anim = $AnimatedSprite2D
var alive = true

func _physics_process(delta):
	var player = $"../../Player"
	var player_distance = position.distance_to(player.position)
	
	if alive:
		if player_distance < 500:
			chase = true
			anim.play("Run")
		else:
			chase = false
			anim.play("idle")
			
		var direction = (player.position - position).normalized()
		
		if chase:
			velocity.x = direction.x * speed
			velocity.y = direction.y * speed
		else:
			velocity.x = 0
			velocity.y = 0
			
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	
		move_and_slide()


func _on_death_body_entered(body):
	if body.name == "Player":
		death()
		
func death():
	alive = false
	anim.play("Death")
	await anim.animation_finished
	queue_free()
		
