var dot_id = argument0;

with (obj_Controller) {
	if (drawing_line) {
		target_dot = dot_id;
		
		//  STEP 1: Create action list entry for save/load/undo/redo	
		var action = instance_create_layer(0, 0, "Instances", obj_Action);
		action.type = "drawLine";
		action.source_dot_row = source_dot.row;
		action.source_dot_col = source_dot.col;
		action.target_dot_row = target_dot.row;
		action.target_dot_col = target_dot.col;
		
		// destroy Redo history on non-Redo action after 1+ Undo
		// 3 actions, 1 undo:
		// actions_size = 3
		// actions_undo_tip = 2
		// last index: 2
		var actions_size = ds_list_size(actions);
		if (actions_size > actions_undo_tip) {
			for (var i = actions_undo_tip; i <= actions_size - 1; i++) {
				instance_destroy(ds_list_find_value(actions, i));
			}
		}
		
		ds_list_add(actions, action);
		actions_undo_tip = ds_list_size(actions);
		
		// STEP 2: Have the source dot create the actual line
		dot_createLine(source_dot, target_dot);
		
		// STEP 3: Reset draw state tracking variables
		target_dot = -1;
		source_dot = -1;
		drawing_line = false;

	} else {
		drawing_line = true;
		source_dot = dot_id;
	}
}