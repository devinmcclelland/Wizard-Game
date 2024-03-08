/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 0550EE7F
/// @DnDArgument : "key" "ord("E")"
var l0550EE7F_0;
l0550EE7F_0 = keyboard_check_pressed(ord("E"));
if (l0550EE7F_0)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1566EEA1
	/// @DnDParent : 0550EE7F
	/// @DnDArgument : "function" "room_swap"
	room_swap();
}