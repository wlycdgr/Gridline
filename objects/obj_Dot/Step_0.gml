/// @description Insert description here
// You can write your code in this editor
var distance_to_cursor = point_distance(x, y, mouse_x, mouse_y);
if (distance_to_cursor < controller_id.grid_spacing / 2) {
	dot_radius = controller_id.grid_spacing / 4;
	
	if (mouse_check_button_pressed(1)) {
		controller_handleDotClick(id);
	}
} else {
	dot_radius = 1;
}