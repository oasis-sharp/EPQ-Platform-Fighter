player = 1;


right = ord("D");
left = ord("A");
up = vk_space;
upDir = ord("W");
walk1 = ord("K");
down = ord("S");
dodge = ord("L");


normal = ord("P");
special = ord("O");



child = 0;

with(child = instance_create_layer(x,y, "Instances", player_child)){
	parent = other.id;	
}

setup(id);
shine_setup(id);
shine_ai_setup(id);
