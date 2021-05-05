extends Area2D

export var speed: float =200;
var direction: Vector2;

var Velocidad = Vector3()


func _physics_process(delta) -> void:
	move_local_x(direction.x * speed * delta);
	
	if direction.y == 1:
		move_local_y(direction.y * (speed*2) * delta);
	else:
		move_local_y(direction.y * speed * delta);

	move_and_slide(Velocidad * delta)
	
	if(get_slide_collsion(get_slide_count()-1) != null):
		var obj_col = get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("Enemigo")):
			queue_free()
