extends Node2D

func createFruitItem():
	var loadFruit = load("res://Scenes/Reusables/Apple.tscn")
	var fruit = loadFruit.instance()
	
	var positionX = randi() % 1000 + 1
	var positionY = randi() % 50 + 1
	
	var gravityScale = 2
	
	fruit.transform = Transform2D(0, Vector2(positionX, positionY))
	fruit.set_gravity_scale(gravityScale)
	get_tree().get_root().add_child(fruit)
	
		
func _on_Timer_timeout():
	createFruitItem()
