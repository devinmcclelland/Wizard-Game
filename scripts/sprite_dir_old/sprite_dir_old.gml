/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 107D5FB3
/// @DnDComment : // Script assets have changed for v2.3.0 see$(13_10)// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @DnDArgument : "funcName" "anim_old"
function anim_old() 
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 630DAA32
	/// @DnDParent : 107D5FB3
	/// @DnDArgument : "expr" "hmove != 0 or vmove != 0"
	if(hmove != 0 or vmove != 0)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 5A2A6175
		/// @DnDParent : 630DAA32
		/// @DnDArgument : "value" "Rafi_Frames_Small_Walk_down"
		/// @DnDArgument : "instvar" "10"
		sprite_index = rs_wk_down;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 11578FF9
	/// @DnDParent : 107D5FB3
	else
	{
		/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
		/// @DnDVersion : 1
		/// @DnDHash : 6958D0B5
		/// @DnDParent : 11578FF9
		/// @DnDArgument : "value" "Rafi_Frames_Small_Idle_down"
		/// @DnDArgument : "instvar" "10"
		sprite_index = rs_id_down;
	}
}