/// @function hitbox_effects(hitbox_id);
/// @param {index} ID
/// @param {index} hitpause
/// @param {index} screenshakeTime
/// @param {index} screenshakeIntensity 

function hitbox_effects(hBoxID, hitpause, sT, sI){	
	hBoxID.hBox_hitpause = hitpause
	hBoxID.hBox_screenshakeTime = sT;
	hBoxID.hBox_screenshakeIntensity = sI;
}