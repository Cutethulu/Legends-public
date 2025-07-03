this.legend_goblin_elite_fighter <- this.inherit("scripts/entity/tactical/enemies/goblin_fighter", {
	m = {},

	function create()
	{
		this.m.Type = this.Const.EntityType.LegendGoblinEliteFighter;
		this.m.XP = this.Const.Tactical.Actor.LegendGoblinEliteFighter.XP;
		this.goblin.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/goblin_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.goblin_fighter.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendGoblinEliteFighter);
		// todo: add some perks
		// ::Legends.Perks.grant(this, ::Legends.Perk.ReachAdvantage);
		// ::Legends.Perks.grant(this, ::Legends.Perk.BattleForged);
		// ::Legends.Perks.grant(this, ::Legends.Perk.Fearsome);
		// ::Legends.Perks.grant(this, ::Legends.Perk.ShieldExpert);
		// ::Legends.Perks.grant(this, ::Legends.Perk.ReachAdvantage);
		// ::Legends.Traits.grant(this, ::Legends.Trait.LegendFleshless);
		// if(::Legends.isLegendaryDifficulty())
		// {
		// 	::Legends.Perks.grant(this, ::Legends.Perk.BattleForged);
		// 	::Legends.Perks.grant(this, ::Legends.Perk.CripplingStrikes);
		// 	::Legends.Perks.grant(this, ::Legends.Perk.CoupDeGrace);
		// }
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/goblin_spear"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/goblin_falchion"));
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			this.m.Items.equip(this.new("scripts/items/armor/greenskins/goblin_medium_armor"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/armor/greenskins/goblin_heavy_armor"));
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/greenskins/goblin_light_helmet"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/helmets/greenskins/goblin_heavy_helmet"));
		}
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = [
			"weapons/named/named_goblin_falchion",
			"weapons/named/named_goblin_pike",
			"weapons/named/named_goblin_spear",
			"weapons/named/named_warbrand"
		];
		this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		::Legends.Perks.grant(this, ::Legends.Perk.Nimble);
		::Legends.Perks.grant(this, ::Legends.Perk.Dodge);
		::Legends.Perks.grant(this, ::Legends.Perk.Relentless);
		return true;
	}

});
