if(hitpause_timer > 0 and sprite_exists(screenShot)){
    draw_sprite_ext(screenShot,0,0,0,1,1,0,c_white,1);
	hitpause_timer-=1;
}