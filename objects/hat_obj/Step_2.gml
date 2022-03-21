x = owner.x

yvel+=0.75;
y+=yvel;

if(owner.y < y){
	y = owner.y	
	yvel = 0;
}

image_xscale = owner.image_xscale;
image_yscale = owner.image_yscale;

