this.legend_smuggle_box_item <- ::inherit("scripts/items/item", {
	m = {},
	function create() {
		this.item.create();
		this.m.ID = "misc.legend_smuggle_box";
		this.m.Name = "Smuggled items";
		this.m.Description = "This chest contains smuggled items. You can open it, but your employer might be not pleased about it.";
		this.m.Icon = "misc/quest_loot_box.png";
		this.m.SlotType = ::Const.ItemSlot.None;
		this.m.ItemType = ::Const.Items.ItemType.Misc;
		this.m.IsDroppedAsLoot = false;
		this.m.IsPrecious = true;
		this.m.IsSellable = false;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 0;
	}

	function onUse( _actor, _item = null ) {
		local contract = ::World.Contracts.getActiveContract();
		if (contract == null)
			return true; // if there's no contract, do nothing but consume item, pretty much item spawner protection
		if (contract.getType() != "contract.legend_camp_smuggle_contract")
			return true; // same as above

		contract.m.Flags.set("BoxOpened", true);

		local item = null;
		local idx = ::Math.rand(1, 3);
		if (idx == 1) {
			local items = clone ::Const.Items.NamedWeapons;
			item = ::new("scripts/items/" + items[::Math.rand(0, items.len() - 1)]);
		} else if (idx == 2) {
			item = ::Const.World.Common.pickHelmet(::Const.World.Common.convNameToList(::Const.Items.NamedHelmets));
		} else if (idx == 3) {
			item = ::Const.World.Common.pickArmor(::Const.World.Common.convNameToList(::Const.Items.NamedArmors));
		}
		::World.Assets.getStash().makeEmptySlots(1);
		::World.Assets.getStash().add(item);

		return true;
	}
});
