extends Area2D

export var speed: float = 400
var direction := Vector2(1, 0)

var Velocidad = Vector3()

func _process(delta):
	$Sprite.scale = Vector2(-direction.x, 1)
	global_position.x += direction.x*speed*delta
	
	move_and_slide(Velocidad * delta)
	
	if(get_slide_collsion(get_slide_count()-1) != null):
		var obj_col = get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("Player")):
			queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
