with (obj_Controller) {
	ds_list_forEach(lines, controller_deleteLine);
	ds_list_clear(lines);
}