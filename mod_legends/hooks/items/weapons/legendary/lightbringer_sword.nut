::mods_hookExactClass("items/weapons/legendary/lightbringer_sword", function(o) {
	o.m.SoundOnLightning <- [
		"sounds/combat/dlc2/legendary_lightning_01.wav",
		"sounds/combat/dlc2/legendary_lightning_02.wav"
	];

	o.addSkill <- function( _skill )
	{
		if (_skill.getID() == ::Legends.Actives.getID(::Legends.Active.SlashLightning))
		{
			::Legends.Actives.grant(this, ::Legends.Active.Slash);
			return;
		}

		weapon.addSkill(_skill);
	}

	o.applyEffect <- function ( _data, _delay )
	{
		this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay, function ( _data )
		{
			for( local i = 0; i < this.Const.Tactical.LightningParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(true, this.Const.Tactical.LightningParticles[i].Brushes, _data.TargetTile, this.Const.Tactical.LightningParticles[i].Delay, this.Const.Tactical.LightningParticles[i].Quantity, this.Const.Tactical.LightningParticles[i].LifeTimeQuantity, this.Const.Tactical.LightningParticles[i].SpawnRate, this.Const.Tactical.LightningParticles[i].Stages);
			}
		}, _data);

		if (_data.Target == null)
		{
			return;
		}

		this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay + 200, function ( _data )
		{
			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = this.Math.rand(10, 20);
			hitInfo.DamageDirect = 1.0;
			hitInfo.BodyPart = this.Const.BodyPart.Body;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			_data.Target.onDamageReceived(_data.User, _data.Skill, hitInfo);
		}, _data);
	}

	o.onDamageDealt <- function ( _target, _skill, _hitInfo )
	{
		local selectedTargets = [];
		local potentialTargets = [];
		local potentialTiles = [];
		local target = null;
		local targetTile = _target.getTile();
		local user = this.getContainer().getActor();
		local myTile = user.getTile();
		if (this.m.SoundOnLightning.len() != 0)
		{
			this.Sound.play(this.m.SoundOnLightning[this.Math.rand(0, this.m.SoundOnLightning.len() - 1)], this.Const.Sound.Volume.Skill * 2.0, user.getPos());
		}

		if (targetTile != null && !targetTile.IsEmpty && _target.isAlive())
		{
			target = targetTile.getEntity();
			selectedTargets.push(target.getID());
		}

		local data = {
			Skill = _skill,
			User = user,
			TargetTile = targetTile,
			Target = target
		};
		this.applyEffect(data, 100);
		potentialTargets = [];
		potentialTiles = [];

		for( local i = 0; i < 6; i = ++i )
		{
			if (!targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = targetTile.getNextTile(i);

				if (tile.ID != myTile.ID)
				{
					potentialTiles.push(tile);
				}

				if (!tile.IsOccupiedByActor || !tile.getEntity().isAttackable() || tile.getEntity().isAlliedWith(user) || selectedTargets.find(tile.getEntity().getID()) != null)
				{
				}
				else
				{
					potentialTargets.push(tile);
				}
			}
		}

		if (potentialTargets.len() != 0)
		{
			target = potentialTargets[this.Math.rand(0, potentialTargets.len() - 1)].getEntity();
			selectedTargets.push(target.getID());
			targetTile = target.getTile();
		}
		else
		{
			target = null;
			targetTile = potentialTiles[this.Math.rand(0, potentialTiles.len() - 1)];
		}

		local data = {
			Skill = _skill,
			User = user,
			TargetTile = targetTile,
			Target = target
		};
		this.applyEffect(data, 350);
		potentialTargets = [];
		potentialTiles = [];

		for( local i = 0; i < 6; i = ++i )
		{
			if (!targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = targetTile.getNextTile(i);

				if (tile.ID != myTile.ID)
				{
					potentialTiles.push(tile);
				}

				if (!tile.IsOccupiedByActor || !tile.getEntity().isAttackable() || tile.getEntity().isAlliedWith(user) || selectedTargets.find(tile.getEntity().getID()) != null)
				{
				}
				else
				{
					potentialTargets.push(tile);
				}
			}
		}

		if (potentialTargets.len() != 0)
		{
			target = potentialTargets[this.Math.rand(0, potentialTargets.len() - 1)].getEntity();
			selectedTargets.push(target.getID());
			targetTile = target.getTile();
		}
		else
		{
			target = null;
			targetTile = potentialTiles[this.Math.rand(0, potentialTiles.len() - 1)];
		}

		local data = {
			Skill = _skill,
			User = user,
			TargetTile = targetTile,
			Target = target
		};
		this.applyEffect(data, 550);
	}
});
