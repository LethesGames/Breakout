class_name SaveData extends Resource

@export var max_score:int = 0

const SAVE_PATH:String = "user://saves.tres"

func save() -> void:
	ResourceSaver.save(self, SAVE_PATH)
	
	
static func load_or_create() -> SaveData:
	var res:SaveData
	var aux
	if FileAccess.file_exists(SAVE_PATH):
		res = load(SAVE_PATH) as SaveData
		aux = load(SAVE_PATH)
	else:
		res = SaveData.new()
	return res
