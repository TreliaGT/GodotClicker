extends TextureButton

var costamount = 150
var lvl = 1
@onready var label = $Label
# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Tool Upgrade $150 "	
	connect("pressed" , self._buttonclick);

func _buttonclick():
	if Global.coins > (costamount * lvl):
		Global.coins = Global.coins - costamount
		$"../Cost Count".text = str(Global.coins)
		lvl = lvl + 1
		label.text = "Tool Upgrade $" + str(costamount * lvl) + " LVL" + str(lvl - 1)	
		if Global.pickaxe == 1:
			Global.pickaxe =  5
		else:
			Global.pickaxe = Global.pickaxe + 5
	

