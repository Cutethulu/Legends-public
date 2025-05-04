this.legend_jousting_tournament_encounter <- this.inherit("scripts/encounters/encounter_event", {
    m = {},
    function create() {
        this.m.Type = "encounter.legend_jousting_tournament_encounter";
        this.m.Name = "{While at %settlement... | Strolling through %settlement% | Something\'s up at %settlement}";
		this.m.Event = "event.jousting_tournament";
    }
})
