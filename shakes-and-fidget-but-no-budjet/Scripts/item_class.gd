extends Resource
class_name Item_Class

# --- Base: every item type inherits these ---
class BaseItem:
	var item_name : String = ""
	var value : int = 0
	var required_level : int = 1
	var description : String = ""
	var texture_path : String = ""     # res:// path, loaded at runtime

# --- Concrete types ---
class Weapon extends BaseItem:
	var damage : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class Helmet extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class ChessPlate extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class Boots extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class Pants extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class Ring extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class Necklace extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""

class Lucky_Item extends BaseItem:
	var armor : int = 0
	var multiplier : float = 1.0
	var effect : String = ""
