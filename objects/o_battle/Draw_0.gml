//draw background art
draw_sprite(battle_background,0,x,y);

//draw units in depth order

var _unit_with_current_turn = unit_turn_order[turn].id;
for (var i = 0; i < array_length(unit_render_order); i++)
{
	with(unit_render_order[i])
	{
		draw_self();
	}
}


//draw ui boxes
draw_sprite(s_battle_ui,0,x,y);

//positions
#macro COLUMN_ENEMY 60
#macro COLUMN_NAME 400
#macro COLUMN_HP 800
#macro COLUMN_MP 1200
//y positions
#macro LINE_START 788
#macro BODY_START 850
#macro LINE_LEAD 60

//draw headings
draw_set_font(Font1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(x+COLUMN_ENEMY,y+LINE_START,"ENEMY");
draw_text(x+COLUMN_NAME,y+LINE_START,"NAME");
draw_text(x+COLUMN_HP,y+LINE_START,"HP");
draw_text(x+COLUMN_MP,y+LINE_START,"MP");

//draw enemy names
draw_set_font(Font1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _draw_limit = 3;
var _drawn = 0;
for (var i = 0; (i < array_length(enemy_units)) && (_drawn < _draw_limit); i++)
{
	var _char = enemy_units[i];
	if (_char.hp > 0)
	{
		_drawn++;
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		if (_char.id == _unit_with_current_turn) draw_set_color(c_yellow);
		draw_text(x+COLUMN_ENEMY,y+BODY_START+(i*LINE_LEAD),_char.name);
	}
}

//Draw party info
for (var i = 0; i < array_length(party_units); i++)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var _char = party_units[i];
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_NAME,y+BODY_START+(i*LINE_LEAD),_char.name);
	draw_set_halign(fa_right);
	
//hp goes here vvvvv

	draw_set_color(c_white);
	if (_char.hp < (_char.hp_max *0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_HP+200,y+BODY_START+(i*LINE_LEAD),string(_char.hp) + "/" + string(_char.hp_max))
	
	draw_set_color(c_white);
	if (_char.mp < (_char.mp_max *0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_MP+200,y+BODY_START+(i*LINE_LEAD),string(_char.mp) + "/" + string(_char.mp_max));
	
	draw_set_color(c_white);
}


