function anim() 
{

var input_read = string_join("", up, right, down, left);		
	
	if(hmove != 0 or vmove != 0)
	{
		global.input_save = input_read
		
		if(input_read == 1000) || (input_read == 1101)
		{
			sprite_index = rs_wk_up;
		}
	
		if(input_read == 0100) || (input_read == 1110)
		{
			sprite_index = rs_wk_right;
		}
	
		if(input_read == 0010) || (input_read == 0111)
		{
			sprite_index = rs_wk_down;
		}
	
		if(input_read == 0001) || (input_read == 1011)
		{
			sprite_index = rs_wk_left;
		}
	
		if(input_read == 1100)
		{
			sprite_index = rs_wk_upright;
		}
	
		if(input_read == 0110)
		{
			sprite_index = rs_wk_downright;
		}
	
		if(input_read == 0011)
		{
			sprite_index = rs_wk_downleft;
		}
	
		if(input_read == 1001)
		{
			sprite_index = rs_wk_upleft;
		}
		
	}

	else
	{
		
		if(global.input_save == 1000) || (global.input_save == 1101)
		{
			sprite_index = rs_id_up;
		}
	
		if(global.input_save == 0100) || (global.input_save == 1110)
		{
			sprite_index = rs_id_right;
		}
	
		if(global.input_save == 0010) || (global.input_save == 0111)
		{
			sprite_index = rs_id_down;
		}
	
		if(global.input_save == 0001) || (global.input_save == 1011)
		{
			sprite_index = rs_id_left;
		}
	
		if(global.input_save == 1100)
		{
			sprite_index = rs_id_upright;
		}
	
		if(global.input_save == 0110)
		{
			sprite_index = rs_id_downright;
		}
	
		if(global.input_save == 0011)
		{
			sprite_index = rs_id_downleft;
		}
	
		if(global.input_save == 1001)
		{
			sprite_index = rs_id_upleft;
		}
	}
}