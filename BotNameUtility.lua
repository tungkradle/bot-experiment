local U = {}

local dota2teams = {

	[1] = {
		['name'] = "Team Liquid";
		['alias'] = "Liquid";
		['players'] = {
			'MATUMBAMAN',
			'Miracle-',
			'MinD_ContRoL',
			'GH',
			'KuroKy'
		};
		['sponsorship'] = '';
	},
	[2] = {
		['name'] = "Virtus.pro";
		['alias'] = "VP";
		['players'] = {
			'RAMZES666',
			'No[o]ne',
			'9pasha',
			'RodjER',
			'Solo'
		};
		['sponsorship'] = 'G2A';
	},
	[3] = {
		['name'] = "Team Secret";
		['alias'] = "Secret";
		['players'] = {
			'Ace',
			'MidOne',
			'Fata',
			'YapzOr',
			'Puppey'
		};
		['sponsorship'] = 'G2A';
	},
	[4] = {
		['name'] = "Evil Geniuses";
		['alias'] = "EG";
		['players'] = {
			'Arteezy',
			'Suma1L',
			's4',
			'Cr1t-',
			'Fly'
		};
		['sponsorship'] = 'G2A';
	},
	[5] = {
		['name'] = "OG";
		['alias'] = "OG";
		['players'] = {
			'ana',
			'Topson',
			'Ceb',
			'JerAx',
			'N0tail'
		};
		['sponsorship'] = 'Redbull';
	},
	[6] = {
		['name'] = "Natus Vincere";
		['alias'] = "Na'Vi";
		['players'] = {
			'Crystallize',
			'Dendi',
			'GeneRaL',
			'velheor',
			'Lil'
		};
		['sponsorship'] = 'G2A';
	}
	
}

local sponsorships = {"GG.bet", "gg.bet", "VPGAME", "LOOT.bet", "loot.bet", "", "Esports.bet", "G2A", "Dota2.net"};

function U.GetDota2Team()
	local bot_names = {};
	local rand = RandomInt(1, #dota2teams);
	local srand = RandomInt(1, #sponsorships);
	if GetTeam() == TEAM_RADIANT then
		while rand%2 ~= 0 do
			rand = RandomInt(1, #dota2teams); 
		end
	else
		while rand%2 ~= 1 do
			rand = RandomInt(1, #dota2teams); 
		end
	end
	local team = dota2teams[rand];
	for _,player in pairs(team.players) do
		if team.sponsorship == "" then
			table.insert(bot_names, team.alias.."."..player);
		else
			table.insert(bot_names, team.alias.."."..player.."."..team.sponsorship);
		end
	end
	return bot_names;
end

return U