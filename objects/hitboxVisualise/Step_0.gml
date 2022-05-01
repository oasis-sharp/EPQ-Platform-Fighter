if image_index >= image_number - 1 instance_destroy(); // destroy if animation is over
if timer < 0 instance_destroy(); // destroy if timer runs out

timer-=1;
