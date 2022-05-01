/// @function input();
function input(){
		rightHeld = keyboard_check(right);
		leftHeld = keyboard_check(left);
		jumpHeld = keyboard_check(up);
		downHeld = keyboard_check(down); 
		walkHeld = keyboard_check(walk1);
		upHeld = keyboard_check(upDir);
		
		downPressed = keyboard_check_pressed(down);
		
		jumpPressed = keyboard_check_pressed(up);
		dodgePressed = keyboard_check_pressed(dodge);
		
		normalPressed = keyboard_check_pressed(normal);
		specialPressed = keyboard_check_pressed(special);
}