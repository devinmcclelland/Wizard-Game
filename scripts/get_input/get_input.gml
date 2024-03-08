/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1CF6B885
/// @DnDComment : // Script assets have changed for v2.3.0 see$(13_10)// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @DnDArgument : "funcName" "get_input"
function get_input() 
{
	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 1CA3E382
	/// @DnDParent : 1CF6B885
	/// @DnDArgument : "key" "vk_left"
	var l1CA3E382_0;
	l1CA3E382_0 = keyboard_check(vk_left);
	if (l1CA3E382_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1266148C
		/// @DnDParent : 1CA3E382
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "left"
		left = 1;
	}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 7768C2F4
	/// @DnDParent : 1CF6B885
	/// @DnDArgument : "key" "vk_down"
	var l7768C2F4_0;
	l7768C2F4_0 = keyboard_check(vk_down);
	if (l7768C2F4_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 07B0CD0B
		/// @DnDParent : 7768C2F4
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "down"
		down = 1;
	}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 0640A3BE
	/// @DnDParent : 1CF6B885
	/// @DnDArgument : "key" "vk_right"
	var l0640A3BE_0;
	l0640A3BE_0 = keyboard_check(vk_right);
	if (l0640A3BE_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6C4BCB5C
		/// @DnDParent : 0640A3BE
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "right"
		right = 1;
	}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
	/// @DnDVersion : 1
	/// @DnDHash : 59C2887B
	/// @DnDParent : 1CF6B885
	/// @DnDArgument : "key" "vk_up"
	var l59C2887B_0;
	l59C2887B_0 = keyboard_check(vk_up);
	if (l59C2887B_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7BBE1A94
		/// @DnDParent : 59C2887B
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "up"
		up = 1;
	}
}