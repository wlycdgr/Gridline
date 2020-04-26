with (obj_Controller) {
	if (ds_list_size(lines) < 1) return;
	if (undo_tip >= ds_list_size(lines)) return;
	
	undo_tip += 1;
	var line = ds_list_find_value(lines, undo_tip - 1);
	with (line) {
		is_undone = false;
	}
}
	
	
	
	