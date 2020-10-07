GLOBAL_LIST_INIT(boo_phrases, list(
	"You feel a chill run down your spine.",
	"You think you see a figure in your peripheral vision.",
	"What was that?",
	"The hairs stand up on the back of your neck.",
	"You are filled with a great sadness.",
	"Something doesn't feel right...",
	"You feel a presence in the room.",
	"It feels like someone's standing behind you.",
))

/obj/effect/proc_holder/spell/targeted/click/boo
	name = "Boo!"
	desc = "Fuck with the living."
	selection_activated_message		= "<span class='notice'>You prepare to reach across the veil. <b>Left-click to influence a target!</b></span>"
	selection_deactivated_message	= "<span class='notice'>Your presence will not be known. For now.</span>"
	auto_target_single = FALSE
	allowed_type = /atom // No subtypes are safe from spookage.

	ghost = TRUE

	action_icon_state = "boo"
	school = "transmutation"
	charge_max = 2 MINUTES
	starts_charged = FALSE
	clothes_req = 0
	stat_allowed = 1
	invocation = ""
	invocation_type = "none"
	range = 20

/obj/effect/proc_holder/spell/targeted/click/boo/cast(list/targets, mob/user = usr)
	var/atom/target = targets[1]
	ASSERT(istype(target))

	if(target.get_spooked(user))
		return

	charge_counter = charge_max * 0.9 // We've targetted a non-spookable object! Try again fast!
