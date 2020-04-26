with (obj_Controller) {
	if (undo_tip < 1) return; // there's nothing (else) to undo!
	
	var line = ds_list_find_value(lines, undo_tip - 1);
	with  (line) {
		is_undone = true;
	}
	
	undo_tip -= 1;
}