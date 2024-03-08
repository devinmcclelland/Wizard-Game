/// @DnDAction : YoYo Games.Common.Execute_Script
/// @DnDVersion : 1.1
/// @DnDHash : 68013ACE
/// @DnDArgument : "script" "collision"
/// @DnDSaveInfo : "script" "collision"
script_execute(collision);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 664CDEEF
/// @DnDInput : 2
/// @DnDArgument : "var" "_tx"
/// @DnDArgument : "value" "x"
/// @DnDArgument : "var_1" "_ty"
/// @DnDArgument : "value_1" "y"
var _tx = x;
var _ty = y;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6029B863
/// @DnDInput : 2
/// @DnDArgument : "expr" "xprevious"
/// @DnDArgument : "expr_1" "yprevious"
/// @DnDArgument : "var" "x"
/// @DnDArgument : "var_1" "y"
x = xprevious;
y = yprevious;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 5C160374
/// @DnDInput : 2
/// @DnDArgument : "var" "_dis_x"
/// @DnDArgument : "value" "abs(_tx - x)"
/// @DnDArgument : "var_1" "_dis_y"
/// @DnDArgument : "value_1" "abs(_ty - y)"
var _dis_x = abs(_tx - x);
var _dis_y = abs(_ty - y);

/// @DnDAction : YoYo Games.Loops.Repeat
/// @DnDVersion : 1
/// @DnDHash : 1A192202
/// @DnDComment : Move as far as we can in x
/// @DnDArgument : "times" "_dis_x"
repeat(_dis_x)
{
	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 2F8EDD19
	/// @DnDParent : 1A192202
	/// @DnDArgument : "x" "sign(_tx - x)"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "object" "o_solid"
	/// @DnDArgument : "not" "1"
	/// @DnDSaveInfo : "object" "o_solid"
	var l2F8EDD19_0 = instance_place(x + sign(_tx - x), y + 0, [o_solid]);
	if (!(l2F8EDD19_0 > 0))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 79C0E22B
		/// @DnDParent : 2F8EDD19
		/// @DnDArgument : "expr" "sign(_tx -x)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "x"
		x += sign(_tx -x);
	}
}

/// @DnDAction : YoYo Games.Loops.Repeat
/// @DnDVersion : 1
/// @DnDHash : 0803FD3E
/// @DnDComment : Move as far as we can in y
/// @DnDArgument : "times" "_dis_y"
repeat(_dis_y)
{
	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 16F5F38F
	/// @DnDParent : 0803FD3E
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "sign(_ty - y)"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "object" "o_solid"
	/// @DnDArgument : "not" "1"
	/// @DnDSaveInfo : "object" "o_solid"
	var l16F5F38F_0 = instance_place(x + 0, y + sign(_ty - y), [o_solid]);
	if (!(l16F5F38F_0 > 0))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4D33B4E7
		/// @DnDParent : 16F5F38F
		/// @DnDArgument : "expr" "sign(_ty -y)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "y"
		y += sign(_ty -y);
	}
}