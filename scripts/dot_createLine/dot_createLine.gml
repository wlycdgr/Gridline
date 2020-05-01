var source_dot = argument0;
var target_dot = argument1;

with (source_dot) {
	var line = instance_create_layer(0, 0, "Instances", obj_Line);
	
	line.source_dot = id;
	line.target_dot = target_dot;	
	
	ds_list_add(lines, line);
}