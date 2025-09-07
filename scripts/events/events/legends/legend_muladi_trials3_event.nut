//Conditions:
//- Must have 1x Muladi bro with flag MuladiTrials2 from EV2
//- Must have been at least 15 days since EV2 occurred.
//- Must not be within 8 tiles of a settlement.
//- No brother must have the flags “MuladiTrials1” or “MuladiTrials3”.

this.legend_Muladi_Trials3_event <- this.inherit("scripts/events/legends", {
  m = {
    Muladi = null,
  },
  function create() {
    this.m.ID = "event.legends.muladi.trials3";
    this.
    this.
    this.m.Screens.push({
      ID = "Start",
      Text = "[img]gfx/ui/events/event_05.png[/img]{You\’re consulting your ledgers in your tent when %muladi% strides in. They\’re looking much better since their myriad injuries from southern bandits and northern peasants alike, and you invite them to sit across from you. Closing your books and meeting the muladi\’s gaze, you see the distress and uncertainty in %their_muladi% expression; they look both deep in thought and completely listless, like a scribe doing battle with their own mind. You ask them what\’s going on, and for a moment energy returns to their eyes.%SPEECH_ON%Captain. I\’ve been thinking a lot lately. About me, my place in the company. About who I am- what I am.%SPEECH_OFF%You can\’t hide your concern as the mercenary-muladi across fidgets and searches their mind for answers they know aren\’t there. %SPEECH_ON%The truth is, I don\’t really know anymore. Before I became what the southerners call \‘muladi\’, I felt empty, directionless. Like a ship without sails, just swaying to the winds of whatever came its way. In wandering the south of the world, I thought I would discover that purpose, but only found prejudice, anger, fear, and more questions. Whether ploughing fields or hunting hyenas, everything I did felt like an imitation of what I should be doing, of who I should be. Wandering felt like I would make my own path, but I just felt more lost, caught in a storm of confusion where I never felt myself, never felt at home. Then I saw your company recruiting and thought maybe I could get enough crowns to buy my place somewhere, to purchase my own mind back from doubt and unknowing: to figure out who I was.%SPEECH_OFF%You worry perhaps they have and are here to announce their departure from the %company%, but they continue before you can dwell on such concerns.%SPEECH_ON%But I found something else whilst here. I found people who don\’t mock my past, who don\’t fear me for what I am. With the others, I don\’t fear that my life between two worlds dooms me to live amongst neither, because here we are, fighting and living and bleeding in a world of our own making. The longer I spend here, the more I see of the pain in the lands I traverse, the more I feel at peace with my own being, as though my existence isn\’t some aberration or mockery of the life I could or should be leading. And yet, whilst it makes me feel more secure in who I am, it makes me wonder if my life was never amongst the sands or in the settlements of the north, but here, amongst friends who I would fight and die for, and who in turn would fight and die for me. I\’m not sure, captain. To be muladi or mercenary or both, I feel certain my place is here amongst the company, but I don\’t know what that makes me anymore. Does that make sense?%SPEECH_OFF%The place of any man within the world is a scary thing to grapple with, and you understand %them_muladi% all too well. You consider their growth in your band of mercenaries, their skills honed both in battle and across their travels. Thoughtfully, you respond…}",
      Title = "At Camp...”
      Image = "",
      List = [],
      Characters = [],
      Options = [{
        Text = "Your life is no farce- seize your muladi identity, wear it as armour!"
        getresult = @(_event) "1"
        
        Text = "The company can be your home, if you want it to be."
        getresult = @(_event) "2"

  this.m.Screens.push({
    ID = "1"
    Title = "An Identity Affirmed"
    Text: "[img]gfx/ui/events/event_170.png[/img]{You tell the muladi about how they sound like they have in fact discovered themself amongst your company, and that they know their worth as muladi is no less than yours as captain, or any of the men in the company. You tell them to use the labels the world puts upon them as their armour- to wield their reputation as a %person_muladi% between worlds as a mighty weapon. A brief period of silence follows, quickly broken as %muladi% rises, steeled in themself and their purpose. %SPEECH_ON%Alright then. I will. Thank you, captain.%SPEECH_OFF%You fear you had offended the normally talkative %person%, but a sly smile and confident stride out of your tent tell you your words struck true. In the coming days, the muladi would lean back into the teachings and skills that helped them thrive amongst the deserts and plains of the south, reforged in their outlook and self-value. At the moment though, you merely return to your ledgers, reflecting on the conversation, and cursing that you forgot what page you were using.}",
    Options = [{
        Text = "To know oneself is the most important thing in this world."
        getResult = @(_event) 0
        //- Muladi bro has the description for their origin amended, see below.
        //- Muladi bro receives +14 resolve, +22 health, +8 initiative, +2MATK and +2RATK. Having recovered and become stronger than ever, the muladi has reinforced their values of rugged living, semi-nomadism, and strong street smarts. While they haven’t thrived in the martial skills as much as they could have under a different direction, their restored faith in the trajectory of their life bolsters their presence on the battlefield. (Subject to balance!)
        //- Muladi bro loses the trait “Slack”, if present. If not present, gain the trait “Ambitious”, and if “Ambitious” is present, gain an additional +2 resolve and +2 initiative. (Willing to lose this clause if it’s against the mod’s culture around traits, or if it’s too cumbersome to implement.)
        //- Muladi bro receives a mood boost of 3.
        //- Muladi bro receives flag MuladiTrials3

        // Mood modifier for Muladi if they stick by their muladi identity: “Despite everything, It\’s still me.”
        //Background amendment for Muladi background: “\nHaving struggled and bled for their life between two worlds, %brother% has reaffirmed who they are, spitting in the faces of those who would decry and denounce %them_brother%. Assured in the path they walk, this muladi promises a most fierce retribution that fuses the calculated cunning of the south, and raw strength of the north.”
          
  this.m.Screens.push({
    ID = "2"
    Title = "A %Person_muladi% Remade"
    Text: "[img]gfx/ui/events/event_134.png[/img]{You recount the problems the muladi has experienced just in your company: the beatings from southerners, the stabbings from northerners, the suspicion they attract simply for who they are. You remark how the company could be the home they\’re seeking- the purpose they crave. To fight amongst their brothers could be their calling, if they wanted it. A moment passes, and %muladi% speaks with a confident nod.%SPEECH_ON%Aye. I think that is what I want! This life has given me nothing but spite for too long, now I have the company, I feel things can be better.%SPEECH_OFF%They rise and give you a confident smile, then leaves without another word. You know the mercenary has found a good place here amongst the others, and are certain they will fight to give the company all they\’ve got going forward. In the coming days, the mercenary would shed their muladi habits in favour of regular sparring and training with the others, laughing and learning with the rest of the men as a new %person_muladi%. At the moment though, you merely return to your ledgers, reflecting on the conversation, and cursing that you forgot what page you were using.}",
    Options = [{
        Text = "%Company% stands a little stronger with %muladi% in the ranks."
        getResult = @(_event) 0
        //- Muladi bro has their background replaced with Companion.
        //- Muladi/Companion bro receives +3 resolve, +6 health, +8 fatigue, +6 MATK, +6 RATK, +6 MDEF, +6RDEF. (This makes up for some of the harm suffered in the previous Muladi Trials events, but does not totally undo the damage. Instead, the emphasis on martial skills like ATK/DEF and fatigue highlights how the bro is leaning more into their martial side. (Subject to balance!)
        //- Muladi/Companion bro receives a mood boost of 3.
        //- Muladi/Companion bro loses the trait “Slack”, if present. If not present, gain the trait “Ambitious”, and if “Ambitious” is present, gain an additional +2 resolve and +2 initiative. (Willing to lose this clause if it’s against the mod’s culture around traits, or if it’s too cumbersome to implement.)
        //- Muladi/Companion bro receives flag MuladiTrials3

        // Mood modifier for Muladi/Companion bro if they abandon their muladi identity: “Excited to carve out a new life with the company!”
        //Background description for new Companion background: “Having suffered at the hands of the fearful and ignorant for too long, %brother% has left their life as a wayfaring muladi behind, instead fully dedicating their spirit to the company and its continued success. No longer just an extra warm body to fill the ranks, this bro considers the company family, and will use their skills- both new and old- to protect it, or die trying.”
