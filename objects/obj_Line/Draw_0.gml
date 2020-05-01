/// @description Draw the line
var source_x = source_dot.x;
var source_y = source_dot.y;
var target_x = target_dot.x;
var target_y = target_dot.y;

draw_set_color(c_black);
draw_line_width(source_x, source_y, target_x, target_y, line_width);