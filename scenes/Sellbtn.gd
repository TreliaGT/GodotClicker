extends TextureButton

var costamount = int(randf_range(1, 10))
@onready var label = $Label
# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "buying " + str(costamount) + " Crystals"	
	connect("pressed" , self._buttonclick);

func _buttonclick():
	if Global.crystals > costamount:
		Global.crystals = Global.crystals - costamount
		$"../Crystal Count".text = str(Global.crystals)
		Global.coins = Global.coins + (costamount * Global.crystalrate)
		$"../Cost Count".text = str(Global.coins)
		costamount = int(randf_range(1, 10))
		label.text = "buying " + str(costamount) + " Crystals"	
