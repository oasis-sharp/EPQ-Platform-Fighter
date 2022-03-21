/// @function kill_player();

function kill_player(){
	phy_position_x = xstart;
	phy_position_y = ystart;
	percent = 0;
	phy_speed_x = 0;
	phy_speed_y = 0;

	debugger.screenshakeIntensity = 4;
	debugger.screenshakeTimer = 10;
}