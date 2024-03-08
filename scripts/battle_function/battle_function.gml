// Global scripts that have to do with battles will occur here

function new_encounter(_enemies, _bg)
//this function will be called when making a new encounter
{
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999, 
		o_battle,
		{enemies: _enemies, creator: id, battle_background: _bg}
	);
}