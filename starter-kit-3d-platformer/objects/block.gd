extends RigidBody3D

# Called when the node is added to the scene
func _ready():
	# Connect to the "body_entered" signal to detect collisions
	self.body_entered.connect(on_body_entered)

# Function to handle collisions
func on_body_entered(body):
	# Put the RigidBody to sleep when it hits another body
	if body.is_in_group("ground") or body.is_in_group("block"):  # Ensure ground and blocks are in relevant groups
		$ExplosionSound.play()
		await get_tree().create_timer(0.5).timeout
		freeze = true  # Freeze the RigidBody3D by putting it to sleep
	else:
		queue_free()
