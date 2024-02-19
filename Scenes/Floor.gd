extends Node2D

func _on_collisionItemDestruction_area_entered(area):
	area.get_parent().queue_free()
