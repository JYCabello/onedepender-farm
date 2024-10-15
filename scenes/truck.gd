extends CharacterBody2D

class_name Truck

var is_loaded = false
@export var path_follow: PathFollow2D
@export var speed = 150.0


func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	global_position = path_follow.global_position
	$AnimatedSprite2D.play(get_animation_name())
	move_and_slide()

func get_animation_name() -> String:
	var state = "full" if is_loaded else "empty"
	var looking_at = update_looking_at()
	var looking_at_str = "down"
	match looking_at:
		LookingAt.up:
			looking_at_str = "up"
		LookingAt.left:
			looking_at_str = "left"
		LookingAt.right:
			looking_at_str = "right"
	return state + "-" + looking_at_str


func update_looking_at() -> LookingAt:
	var angle = path_follow.rotation
	var slice = PI / 4  # Adjust slice for 4 directions
	if -1 * slice < angle && angle <= 1 * slice:
		return LookingAt.right
	if 1 * slice < angle && angle <= 3 * slice:
		return LookingAt.down
	if -3 * slice < angle && angle <= -1 * slice:
		return LookingAt.up
	return LookingAt.left

enum LookingAt {
	up,
	down,
	left,
	right,
}
