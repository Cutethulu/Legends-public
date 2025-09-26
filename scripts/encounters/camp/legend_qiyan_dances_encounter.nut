this.legend_qiyan_dances_encounter <- this.inherit("scripts/encounters/camp/", {
m = {
		qiyan = null
	},
	function create()
	{
		this.m.ID = "legend_qiyan_dances";
		this.m.Title = "Around the Campfire...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "Sitting around the campfire with the rest of the company, your thoughts almost melt with the licking flames as you stare into the heap of glowing logs and bramble. Much of the company is equally transfixed as a quiet contemplation enthrals them to the flame and the thoughts of recent days. Suddenly, a shadow sucks you out of your trance and you look up to see %qiyan%, the company qiyan circling the flame, foot sweeping the ground between the company and the object of their focus. By design perhaps, most of the company has turned their focus to the southern woman, who with delicate yet deliberate movements is clearing a circle around the fire, kicking loose stones and outstretched legs to form a clear patch of earth. Sufficiently intrigued, the company obliges, pulling back and making space for the mysterious singer-dancer.\n\nHer stage now cleared and a suitably receptive audience acquired, the qiyan begins her show, leading with a low chant and a slow, rhythmic dance. She methodically circles the flame, casting shadows that creep onto and past each member of the company as her chant becomes a gentle song you can\'t understand, although it stirs a sense of loss and longing within you. After a few moments of this, you think the qiyan is almost done, but a sudden explosion in energy dispels such thoughts: her gentle circling of the flame has erupted into movements you can only describe as leaps as she repeatedly clears the flame in single, graceful movements. The awe of the company is clear- equal part impressed by her musical cadence and concerned that one wrong step would plunge her into the flames. As though playing into the fears of her crowd, %qiyan% edges closer to the flame, twirling and spinning in such elegant twists that she appeared as one with the flame itself, bursting forth from it to plaster shadows across the company, now thoroughly rapt by her dangerous and haunting performance. \n\nJust as you thought the dancer had in fact become the very flames she courted, a sudden wave of dust cakes the flame and tempers the raging storm within. A single movement signalled both the end of her dance and the flame\'s dominant presence before the company. With a simple bow and smile, the resplendent dancer thanks you for the company, and wishes everyone a good night. The crackling of the now subdued flame captures the mood well, with much of the company slack-jawed at the touching performance they just witnessed. Some take it as a good cue to leave for sleep, others remain by the fire, stunned into a new contemplation. Beside them, embers crack, and the fire begins to whisper back to life.",
			Image = "39",
			List = [],
			Options = [
				{
					Text = "I\'m sure I could dance like that, back in my day...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.qiyan.getImagePath());
				// Rewards
				if (_event.m. != null) {
					local skill = this.new("Melee Defence, 1-2");
					_event.m..getSkills().add(skill);
					this.List.push({ id = 10, icon = skill.getIcon(), text = _event.m..getName() + " gains " + skill.getName() });
				}
				if (_event.m. != null) {
					local skill = this.new("Resolve, 2");
					_event.m..getSkills().add(skill);
					this.List.push({ id = 10, icon = skill.getIcon(), text = _event.m..getName() + " gains " + skill.getName() });
				}
				if (_event.m. != null) {
					local skill = this.new("Initiative, 2-4");
					_event.m..getSkills().add(skill);
					this.List.push({ id = 10, icon = skill.getIcon(), text = _event.m..getName() + " gains " + skill.getName() });

        // Reward should also include increasing the mood of all in the company by 1.0 --- "Amazed by the qiyan\'s mesmerising performance!"
        // Reward should also include increasing the mood of the qiyan sis by 2.0 --- "Pleased by her impressive performance for the company."
				}
				this.Options.push({
					Text = "I\'m sure I could dance like that, back in my day...",
					function getResult( _event )
					{
						return 0;
					}
				});
			}

		});
	}

	function onUpdateScore()
	{
		local currentTile = this.World.State.getPlayer().getTile();
		local brothers = this.World.getPlayerRoster().getAll();
		local candidate_qiyan = [];
		foreach( bro in brothers )
		{
			if ((bro.getBackground().getID() == "qiyan") && (bro.getLevel() >= 3)) candidate_qiyan.push(bro);
		}
		if (candidate_qiyan.len() == 0) return;
		if (candidate_qiyan.len() != 0) this.m.qiyan = candidate_qiyan[this.Math.rand(0, candidate_qiyan.len() - 1)];
		this.m.Score = 5;
	}

	function onPrepare()
	{
	}


	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
		this.m.qiyan = null;
	}

});
