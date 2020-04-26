var list = argument0;
var callback = argument1;

var list_size = ds_list_size(list);
for (var i = 0; i < list_size; i++) {
	var list_item = ds_list_find_value(list, i);
	script_execute(callback, list_item);
}