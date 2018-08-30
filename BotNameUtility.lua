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
	local team = {}
	local t1 = RandomInt(1, #dota2teams);
	local t2 = RandomInt(1, #dota2teams);
	local srand = RandomInt(1, #sponsorships);
	-- Make sure Radiant and Dire choose different teams
	print(t1, t2)
	if GetTeam() == TEAM_RADIANT then
		t1 = RandomInt(1, #dota2teams);
		t2 = RandomInt(1, #dota2teams);
	end
	print(t1, t2)
	-- Assign Names/Sponsors
	if GetTeam() == TEAM_RADIANT then
		team = dota2teams[t1];
	else
		team = dota2teams[t2];
	end
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