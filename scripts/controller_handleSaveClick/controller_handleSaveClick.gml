with (obj_Controller) {
	// If we haven't saved this drawing yet,
	// ask user to specify a file to save to
	if (savefile == - 1) {
		var filename = get_save_filename("savedata|*.txt", "");
		savefile = filename;
	}
	
	// TODO alert the user if we are unable to save
	var file = file_text_open_write(savefile);
	if (file == -1) {
		savefile = -1;
		return;
	}
	
	// Extract the data to be saved
	// into an easy-to-compare format
	// (this should help with checking whether saving is necessary)
	//var line_source_rows = ds_list_create();
	//var line_source_cols = ds_list_create();
	//var line_target_rows = ds_list_create();
	//var line_target_cols = ds_list_create();
	
	var line_count = ds_list_size(lines);
	for (var i = 0; i < line_count; i++) {
		var line = ds_list_find_value(lines, i);
		
		with (line) {
			if (is_undone) continue;
			
			//ds_list_add(line_source_rows, source_dot.row);
			//line
		
			file_text_write_string(file, "from:");
			file_text_writeln(file);
			file_text_write_real(file, source_dot.row);
			file_text_writeln(file);
			file_text_write_real(file, source_dot.col);
			file_text_writeln(file);
		
			file_text_write_string(file, "to:");
			file_text_writeln(file);
			file_text_write_real(file, target_dot.row);
			file_text_writeln(file);
			file_text_write_real(file, target_dot.col);
			file_text_writeln(file);
		}
	}
	
	// Release the file pointer
	file_text_close(file);
}