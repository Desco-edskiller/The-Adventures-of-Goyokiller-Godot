extends KinematicBody2D

signal atacck

onready var pos_fire = $Sprite/pos_fire
var player = null

var velocity = Vector2();
var distance = Vector2();
var speed = 120;
var direction = Vector2(-1,0);


func _physics_process(delta):
	if $ray.is_colliding() and !player:
		player = $ray.get_collider()
		direction.x = -1
		$Sprite.scale = Vector2(-direction.x, 1)
	elif $ray.is_colliding() and !player:
		player = $ray.get_collider()
		direction.x = 1
		$Sprite.scale = Vector2(-direction.x, 1)
