/// @function screenshake(x, y);
/// @param {index} x  
/// @param {index} y 
function screenshake(shakeForceX, shakeForceY){	
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) +random_range(shakeForceX, -shakeForceY), camera_get_view_y(view_camera[0])+random_range(shakeForceX, -shakeForceY));
	camera_set_view_border(view_camera[0],0,0);
}