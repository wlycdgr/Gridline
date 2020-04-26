var dot_id = argument0;

with (obj_Controller) {
	if (drawing_line) {
		target_dot = dot_id;
	
		var new_line = instance_create_layer(0, 0, "Instances", obj_Line);
		new_line.source_dot = source_dot;
		new_line.target_dot = target_dot;
		
		var new_lines = ds_list_create();
		var old_lines_size = ds_list_size(lines);
		
		for (var i =  0; i < old_lines_size; i++) {
			if (i < undo_tip) {
				ds_list_add(new_lines, ds_list_find_value(lines, i));
			} else {
				controller_deleteLine(ds_list_find_value(lines, i));
			}
		}
		
		ds_list_clear(lines);
		ds_list_copy(lines, new_lines);
		ds_list_add(lines, new_line);
	
		undo_tip = ds_list_size(lines);
	
		target_dot = -1;
		source_dot = -1;
		drawing_line = false;
	
	} else {
		drawing_line = true;
		source_dot = dot_id;
	}
}