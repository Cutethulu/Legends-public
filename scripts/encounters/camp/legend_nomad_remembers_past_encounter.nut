this.legend_nomad_remembers_past_encounter <- ::inherit("scripts/encounters/encounter", {
	m = {
		Nomad = null,
	},

	function create() {
		this.m.ID = "encounter.legend_nomad_remembers_past";
		this.m.Name = ::Const.Strings.randomCampEncounterName();
		this.m.Cooldown = 40 * this.World.getTime().SecondsPerDay;
		this.createScreens();
	}

	function createScreens() {
		this.m.Screens.push({
			ID = "Start",
			Title = "Amongst the sands...",
			Text = "[img]gfx/ui/events/event_157.png[/img]{As you begin to strike camp, you notice %nomad% kneeling in the sand a ways off into the endless expanse of the desert. Approaching %them_nomad%, you see they\’re carefully stacking rocks atop each other, building a small yet formidably constructed cairn of sand and stone. Sensing your presence, %nomad% speaks, ever fixed on their golden monument.%SPEECH_ON%I killed my first man here, captain. Well, not far from here.%SPEECH_OFF%You look around but see only a never-ending sea of gleaming sands, hardly a notable feature or striking landmark to be made from the immensity of the desert. You figure you could live a lifetime here and be unable to recognise this spot from another, but know the nomads have spent countless lifetimes here mastering these lands, so trust %nomad%\’s intuition. Looking back, you see %nomad% has completed their cairn, tearing a piece of fabric from their person to sign it.%SPEECH_ON%A group from the city tracked us, manhunters and muladis in tow otherwise they\’d have been swallowed by the sands trying to find us. They attacked in the night whilst most of us slept or hunted. I was young enough to be amongst those at the camp when it happened, what feels like a lifetime ago…%SPEECH_OFF%They begin on another cairn, this one packed with malice and frustration. It almost crumbles twice before they continue.%SPEECH_ON%A conscript, barely older than myself found me, blood on their spear, hatred in his eyes. The fight was messy and slow, but by the time it was done, my tribe burned. Either scattered to the wind, slain, or carried off in chains to serve a cruel debt to the Gilder. I ran.%SPEECH_OFF%They finish the second cairn and rise to their feet. In a measured movement, they sweep the second cairn back into the sands it rose from leaving only their first cairn standing, fabric slowly dancing in the desert breeze. In their hand they hold a fistful of sand which they kiss and then pocket under their newly torn cloak.%SPEECH_ON%But they didn’t get us all, captain. They didn’t get me.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [{
				Text = "{How much sand do you keep in those pockets?}",
				getResult = @(_event) 0
			function start(_event) {
				this.Characters.push(_event.m.Nomad.getImagePath());

				this.List.push(::Legends.EventList.changeResolve(_event.m.Killer, 2));				//Did I do this bit right?
        this.List.push(::Legends.EventList.changeMood(_event.m.Killer, 1, "Reflected on %their_nomad% survival against the city states"));

//Conditions:
//- Must have a Nomad bro.
//- Must be on a desert tile.
//- Must not be within 4 tiles of a southern city.
//- This event must not have happened within 20 days.

//Outcomes:
//- Nomad bro receives a minor (1) mood boost.
//- Nomad receives a boost of 2 to their Resolve.
