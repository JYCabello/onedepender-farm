extends CollisionShape2D



func _on_fill_point_body_entered(body: Node2D) -> void:
	if body is Truck:
		body.is_loaded = true
