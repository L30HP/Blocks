extends Node3D

@export var scene_to_spawn: PackedScene
@export var spawn_delay: float = 1.5
var score = 0
# Start the process when the scene is ready
func _ready():
	# Create a Timer node for continuous spawning
	var timer = Timer.new()
	timer.wait_time = spawn_delay
	timer.one_shot = false  # Make it loop
	add_child(timer)
	
	# Connect the timeout signal to the spawn_scene function
	timer.timeout.connect(spawn_scene)
	
	# Start the timer
	timer.start()

# Spawns the scene at a random spawn point
func spawn_scene():
	score +1
	var spawn_points = $Points.get_children()  # Get all child spawn points
	var random_spawn_point = spawn_points[randi() % spawn_points.size()]  # Pick a random one
	
	# Instance and position the new scene
	var instance = scene_to_spawn.instantiate()
	instance.transform = random_spawn_point.transform
	add_child(instance)
