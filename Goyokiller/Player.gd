extends Area2D


const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -900
const UP = Vector2(0, -1)

onready var Gun_pos = $privoitGuns
onready var Time = $Reaload

var default_bullet = load("res://Bala Goyo.tscn")

var bullet_direction := Vector3();
 
onready var sprite = $Sprite
 
var motion = Vector2()
 
func _physics_process(delta):
	# apply gravity to the player
	motion.y += gravity
	var friction = false
 
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		friction = true

func _process(delta) -> void:
	if Input.is_action_pressed("attack"):
		fire(default_bullet, bullet_direction.x, bullet_direction.y)

func fire(default_bullet_l, direction_x = direction.x, direction_y = 0) -> void:
	if !self.reload_time.is_stopped():
		return
	
	if !direction_x and !direction_Y: #if direction.x == 0 and direction.y == 0;
		direction_x = $pivot.scale.x;
	
	var new_bullet = default_bullet_l.instance();
	self.get_parent().add_child(new_bullet);
	new_bullet.global_position = self.Gun_pos.global_position;
	new_bullet.direction = Vector3(direcion_x, direction_y);
	
	self.reload_time.start()
