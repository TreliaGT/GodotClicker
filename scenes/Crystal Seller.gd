extends TextureButton

var costamount = 300
var lvl = 1
@onready var label = $Label
@onready var timer = $"../crystalSeller"
# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Crystal Seller $300"	
	connect("pressed" , self._buttonclick);

func _buttonclick():
	if Global.coins > (costamount * lvl):
		Global.coins = Global.coins - costamount
		$"../Cost Count".text = str(Global.coins)
		lvl = lvl + 1
		label.text = "Crystal Seller  $" + str(costamount * lvl) + " LVL" + str(lvl - 1)	
		if not timer.is_connected("timeout", self._on_timeout_sell):
			timer.timeout.connect(self._on_timeout_sell)
			timer.wait_time = 100
			timer.start()
		
func _on_timeout_sell():
	var costamountcrystal = int(randf_range(1, 200))
	if Global.crystals > costamountcrystal:
		Global.crystals = Global.crystals - costamountcrystal
		$"../Crystal Count".text = str(Global.crystals)
		Global.coins = Global.coins + (costamountcrystal * Global.crystalrate)
		$"../Cost Count".text = str(Global.coins)
