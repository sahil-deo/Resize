extends Label


func _on_visibility_changed():
	if visible:
		AudioManager.playClick()
		await get_tree().create_timer(1).timeout
		visible = false
