oneAbove = 0;
twoAbove = 0;

solid1 = 0;
solid2 = 0;

down1Timer = 0;
down2Timer = 0;

fall1 = 0;
fall2 = 0;

downTime = 14;



playerOneFix = physics_fixture_create();
playerTwoFix = physics_fixture_create();


physics_fixture_set_collision_group(playerOneFix, 1);
physics_fixture_set_box_shape(playerOneFix, 16*image_xscale, 16);
physics_fixture_set_friction(playerOneFix, 0);
physics_fixture_set_restitution(playerOneFix, 0);

physics_fixture_set_collision_group(playerTwoFix, 2);
physics_fixture_set_box_shape(playerTwoFix, 16*image_xscale, 16);
physics_fixture_set_friction(playerTwoFix, 0);
physics_fixture_set_restitution(playerTwoFix, 0);


