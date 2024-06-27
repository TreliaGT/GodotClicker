extends TextureButton

var costamount = 150
var lvl = 1
@onready var label = $Label
@onready var timer = $"../helpingHand"
# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Helping Hand $150 "	
	connect("pressed" , self._buttonclick);

func _buttonclick():
	if Global.coins > (costamount * lvl):
		Global.coins = Global.coins - costamount
		$"../Cost Count".text = str(Global.coins)
		lvl = lvl + 1
		label.text = "Helping Hand $" + str(costamount * lvl) + " LVL" + str(lvl - 1)	
		if not timer.is_connected("timeout", self._on_timeout_crystal):
			timer.timeout.connect(self._on_timeout_crystal)
			timer.wait_time = 10 # 10 sec
			timer.start()
		
func _on_timeout_crystal():
	Global.crystals = Global.crystals + (lvl-1)*10;
	$"../Crystal Count".text = str(Global.crystals)
