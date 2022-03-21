player = 2;

right = vk_right;
left = vk_left;
up = vk_up;
down = vk_down;
upDir = vk_up
walk1 = ord(",");
dodge = ord(".");
normal = ord("N");
special = ord("M");

child = 0;


with(child = instance_create_layer(x,y, "Instances", player_child)){
	parent = other.id;	
}

setup(id);
shine_setup(id);