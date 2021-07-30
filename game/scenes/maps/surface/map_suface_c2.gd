extends TileMap

var map_area_x = MapVar.map_area_x - 4
var map_area_y = MapVar.map_area_y - 4
var range_x = map_area_x / 2
var range_y = map_area_y / 2

var stones = 10
var craters = 4
var rng = RandomNumberGenerator.new()

var destined = []

func _ready():
	pass

func _init():

	rng.randomize()
	for i in range(stones):
		paint_random_stone()
	
	
	for i in range(craters):
		paint_random_crater()

func paint_random_stone():
	var stone_r_x = rng.randi_range(0 - range_x, range_x)
	var stone_r_y = rng.randi_range(0 - range_y, range_y)
	if can_paint(stone_r_x, stone_r_y):
		destined.append(Vector2(stone_r_x, stone_r_y))
		set_cell(stone_r_x, 
		stone_r_y, 
		rng.randi_range(0, 3))
	else:
		paint_random_stone()

func paint_random_crater():
	var crat = rng.randi_range(0,1)
	var sprite = 0
	
	if crat == 0:
		sprite = 4
	if crat == 1:
		sprite = 8
		
	var crat_pos_x = rng.randi_range(0 - range_x, range_x)
	var crat_pos_y = rng.randi_range(0 - range_y, range_y)
	
	if can_paint(crat_pos_x, crat_pos_y) && can_paint(crat_pos_x + 1, crat_pos_y) && can_paint(crat_pos_x, crat_pos_y + 1) && can_paint(crat_pos_x + 1, crat_pos_y + 1):
		destined.append(Vector2(crat_pos_x, crat_pos_y))
		destined.append(Vector2(crat_pos_x + 1, crat_pos_y))
		destined.append(Vector2(crat_pos_x, crat_pos_y + 1))
		destined.append(Vector2(crat_pos_x + 1, crat_pos_y + 1))
		set_cell(crat_pos_x, crat_pos_y, sprite)
		set_cell(crat_pos_x + 1, crat_pos_y, sprite + 1)
		set_cell(crat_pos_x, crat_pos_y + 1, sprite + 2)
		set_cell(crat_pos_x + 1, crat_pos_y + 1, sprite + 3)
	else:
		paint_random_crater()

func can_paint(r_x, r_y):
	return !destined.has(Vector2(r_x, r_y))
