extends TileMap

func _ready():
	pass # Replace with function body.

func _init():
	var range_x = MapVar.map_area_x / 2
	var range_y = MapVar.map_area_y / 2
	for x in range(MapVar.map_area_x):
		for y in range(MapVar.map_area_y):
			set_cell(x - range_x, y - range_y, 0)
