if(place_meeting(x,y, mouse)){
	image_blend = c_gray;
	
	if(mouse_check_button(mb_left)){
		room+=1;
	}
}
else{
	image_blend = c_white;	
}