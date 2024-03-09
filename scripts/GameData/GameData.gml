//Action Library
global.action_library = 
{
	attack:
	{
		name: "Attack",
		description: "{0} attacks!",
		sub_menu: -1,
		target_required: true,
		target_enemy_by_default: true,
		target_all: MODE.NEVER,
		user_animation: "attack",
		effect_sprite: atk_test_anim,
		effect_on_target: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength *0.25));
			battle_change_hp(_targets[0], -_damage, 0);
		}
	}
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

//Party data
global.party = 
[
	{
		name: "Raffi",
		hp: 89,
		hp_max: 89,
		mp: 5,
		mp_max: 15,
		strength: 6,
		sprites: { idle: ra_id_test, attack: ra_atk_test, defend: rs_id_up, down: ra_dwn_test},
		actions: [],
	}
	,
	{
		name: "Raphael",
		hp: 20,
		hp_max: 89,
		mp: 10,
		mp_max: 15,
		strength: 6,
		sprites: { idle: ra_id_test, attack: ra_atk_test, defend: rs_id_up, down: ra_dwn_test},
		actions: []	,	
	}
];

//enemy data
global.enemies =
{
	slime:
	{
		name: "Soipog",
		hp: 89,
		hp_max: 89,
		mp: 10,
		mp_max: 15,
		strength: 6,
		sprites: { idle: soipog5, attack: soipog5_atk, defend: rs_id_up, down: rs_id_up},
		actions: [global.action_library.attack]	,
		xp_value: 10,
		ai_script: function()
		{
			//attack random party member
			var _action = actions[0];
			var _possible_targets = array_filter(o_battle.party_units, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
			return [_action, _target];
			
			
		}
		
	}
}