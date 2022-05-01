
if(dmenu and instance_exists(player1_obj)){

	draw_set_color(c_black)
	draw_text(175,75, "DEBUG")

	draw_text(175,125, "xsp - " + string(player1_obj.phy_speed_x) + " | ysp - " + string(player1_obj.phy_speed_y));
	
	if(instance_exists(hitbox)){
		draw_text(175,150, hitbox.debug_knockback);
	}
	
	if(instance_exists(player1_obj)){
		draw_text(175,100, player1_obj.STATE);
	}
	
}

if(instance_exists(player1_obj)){
	percentP1 = player1_obj.percent;
	percentP2 = player2_obj.percent;
	
}

draw_set_color(c_black);
draw_set_font(UI);
draw_text_ext_transformed(room_width/4, (room_height/15)*14, string(percentP1) + "%", 10, 300, 1, 1, 0)
draw_text_ext_transformed(room_width/4+75, (room_height/15)*14+7,"["+ string(scoreP1)+  "]", 10, 300, 0.7, 0.7, 0)
	
draw_text_ext_transformed((room_width/4)*3, (room_height/15)*14, string(percentP2) + "%", 10, 300, 1, 1, 0)
draw_text_ext_transformed((room_width/4)*3+75, (room_height/15)*14+7,"["+ string(scoreP2)+  "]", 10, 300, 0.7, 0.7, 0)

