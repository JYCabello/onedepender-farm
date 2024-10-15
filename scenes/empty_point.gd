extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Truck:
		body.is_loaded = false
