/// @function calculate_knockback(knockback, growth, percent);
/// @param {index} knockback  
/// @param {index} growth  
/// @param {index} percent 
/// @param {index} weight

function  calculate_knockback(b, s, p, w){
	
	var knockback = p;
	
	knockback*=(50/(w+100))*1.2;
	knockback+=2;
	knockback*=s;
	knockback+=b;
	
	return knockback;
}