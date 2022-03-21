timer-=life;
image_xscale *=grow;
image_yscale *=grow;

image_alpha = timer/100;

if(timer == 0){
	instance_destroy();	
}