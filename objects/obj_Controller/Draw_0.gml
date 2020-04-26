/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_orange);
draw_circle(mouse_x, mouse_y, 4, false);

if (drawing_line) {
	var source_x = grid_x + source_dot.col * grid_spacing;
	var source_y = grid_y + source_dot.row * grid_spacing;
	
	draw_set_color(c_black);
	draw_line_width(source_x, source_y, mouse_x, mouse_y, 4);
}