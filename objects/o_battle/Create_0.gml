instance_deactivate_all(true);

units = [];
turn = 0;
unit_turn_order = [];
unit_render_order = [];

turn_count = 0;
round_count = 0;
battle_wait_time_frames = 30;
battle_wait_time_remaining = 0;
current_user = noone;
current_action = -1;
current_targets = noone;

// Make enemies

for (var i = 0; i < array_length(enemies); i++)
{
	enemy_units[i] = instance_create_depth(x+1400+(i*30), y+400+(i*150), depth-10, o_battle_unit_enemy, enemies[i]);
	array_push(units, enemy_units[i]);

}

//Make party

for (var i = 0; i < array_length(global.party); i++)
{
	party_units[i] = instance_create_depth(x+510-(i*30), y+400+(i*150), depth-10, o_battle_unit_pc, global.party[i]);
	array_push(units, party_units[i]);
}

//shuffle turn order

unit_turn_order = array_shuffle(units);

//Get render order
refresh_render_order = function()
{
	unit_render_order = [];
	array_copy(unit_render_order,0,units,0,array_length(units));
	array_sort(unit_render_order,function(_1, _2)
	{
		return _1.y - _2.y;
	});
}

refresh_render_order();

function battle_state_select_action()
{
	//get current unit
	var _unit = unit_turn_order[turn];
	
	//is the unit dead or unable to act?
	if (!instance_exists(_unit)) || (_unit.hp <= 0)
	{
		battle_state = battle_state_victory_check;
		exit;
	}
	
	//Select an action to perform
	//begin_action(_unit.id, global.action_library.attack, _unit.id);
	
	//if unit is player controlled:
	if(_unit.object_index == o_battle_unit_pc)
	{
			//attack random party member
			var _action = global.action_library.attack;
			var _possible_targets = array_filter(o_battle.enemy_units, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
			begin_action(_unit.id, _action, _target);
	}
	else
	{
		//if unit is AI controlled:
		var _enemy_action = _unit. ai_script();
		if (_enemy_action != -1) begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
	}
}

//initiator of actions from both enemies and players

function begin_action(_user, _action, _targets)
{
	current_user = _user;
	current_action = _action;
	current_targets = _targets;
	if (!is_array(current_targets)) current_targets = [current_targets];
	battle_wait_time_remaining = battle_wait_time_frames;
	with (_user)
	{
		acting = true;
		//play user animation if it is defined for that action, and that user
		if (!is_undefined(_action[$ "user_animation"])) && (!is_undefined(_user.sprites[$ _action.user_animation]))
		{
			sprite_index = sprites[$ _action.user_animation];
			image_index = 0;
		}
	}
	battle_state = battle_state_perform_action;
}

function battle_state_perform_action()
{
	//if animation etc is still playing
	if (current_user.acting)
	{
		//when it ends, perform action effect if it exists
		if (current_user.image_index >= current_user.image_number -1)
		{
			with (current_user)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(current_action, "effect_sprite"))
			{
				if (current_action.effect_on_target == MODE.ALWAYS) || ( (current_action.effect_on_target == MODE.VARIES) && (array_length(current_targets) <= 1) )
				{
					for (var i = 0; i < array_length(current_targets); i++)
					{
						instance_create_depth(current_targets[i].x,current_targets[i].y,current_targets[i].depth-1, o_battle_effect, {sprite_index : current_action.effect_sprite});
					}
				}
				else //play it at 0,0
				{
					var _effect_sprite = current_action._effect_sprite
					if (variable_struct_exists (current_action, "effect_sprite_no_target")) _effect_sprite = current_action.effect_sprite_no_target;
					instance_create_depth(x,y,depth-100,o_battle_effect,{sprite_index: _effect_sprite});
				}
				
			}
			current_action.func(current_user, current_targets);
		}
	}
	else //wait for delay and then end the turn
	{
		if (!instance_exists(o_battle_effect))
		{	
			battle_wait_time_remaining--
			if(battle_wait_time_remaining == 0)
			{
				battle_state = battle_state_victory_check;
			}
		}
	}
}

function battle_state_victory_check()
{
	battle_state = battle_state_turn_progression;
}	

function battle_state_turn_progression()
{
	turn_count++;
	turn++;
	//loop turns
	if (turn > array_length(unit_turn_order) - 1)
	{
		turn = 0;
		round_count++;
	}
	battle_state = battle_state_select_action;
}

battle_state = battle_state_select_action;

