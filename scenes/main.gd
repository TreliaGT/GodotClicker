extends Node2D

@onready var my_timer = $RateTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	$MiningButton.connect("pressed", self._on_MiningButton_pressed)
	$Label.text = "Crystals to Coin Rate: " + str(Global.crystalrate)
	my_timer.timeout.connect(self._on_timeout_crystalrate)
	my_timer.wait_time = 600 # 10 mins
	my_timer.start()

#pressing mining
func _on_MiningButton_pressed():
	Global.crystals = 	Global.crystals + Global.pickaxe
	$"Crystal Count".text = str(Global.crystals)


#crystal rate generator
func _on_timeout_crystalrate():
	print("Time")
	Global.crystalrate = int(randf_range(5, 100))
	$Label.text = "Crystals to Coin Rate: " + str(Global.crystalrate)

