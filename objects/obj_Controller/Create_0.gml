/// @description Initialize controller	

grid_width = 512;
grid_height = 512;
grid_spacing = 16;

grid_x = room_width / 2 - grid_width / 2;
grid_y = room_height / 2 - grid_height / 2;

var grid_rows = grid_height / grid_spacing;
var grid_cols = grid_width / grid_spacing;

for (var i = 0; i < grid_cols; i++) {
	for (var j = 0; j < grid_rows; j++) {
		var dot = instance_create_layer(
			grid_x + i * grid_spacing,
			grid_y + j * grid_spacing,
			"Instances",
			obj_Dot
		);
		dot.controller_id = id;
		dot.col = i;
		dot.row = j;
		
		dots[i, j] = dot;
	}
}

drawing_line = false;
source_dot = -1;
target_dot = -1;


var reset_button = instance_create_layer(32, 32, "UI", obj_Button);
reset_button.sprite_index = spr_ResetButton;
reset_button.click_handler = controller_handleResetClick;

//var undo_button = instance_create_layer(32, 112, "Instances", obj_Button);
//undo_button.sprite_index = spr_UndoButton;
//undo_button.click_handler = controller_handleUndoClick;

//var redo_button = instance_create_layer(32, 192, "Instances", obj_Button);
//redo_button.sprite_index = spr_RedoButton;
//redo_button.click_handler = controller_handleRedoClick;

//var save_button = instance_create_layer(32, 272, "Instances", obj_Button);
//save_button.sprite_index = spr_SaveButton;
//save_button.click_handler = controller_handleSaveClick;

//var load_button = instance_create_layer(32, 272, "Instances", obj_Button);
//load_button.sprite_index = spr_LoadButton;
//load_button.click_handler = controller_handleLoadClick;


actions = ds_list_create();
actions_undo_tip = ds_list_size(actions);

savefile = -1;