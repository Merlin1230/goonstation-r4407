/mob/living/silicon/ai/Login()
	..()
	update_clothing()
	for(var/S in src.client.screen)
		del(S)
	src.flash = new /obj/screen( null )
	src.flash.icon_state = "blank"
	src.flash.name = "flash"
	src.flash.screen_loc = "1,1 to 15,15"
	src.flash.layer = 17
	src.blind = new /obj/screen( null )
	src.blind.icon_state = "black"
	src.blind.name = " "
	src.blind.screen_loc = "1,1 to 15,15"
	src.blind.layer = BACKGROUND_LAYER
	src.client.screen += list( src.blind, src.flash )
	if(!isturf(src.loc))
		src.client.eye = src.loc
		src.client.perspective = EYE_PERSPECTIVE
	if (src.stat == 2)
		src.verbs += /mob/proc/ghostize
	else
		for(var/obj/machinery/ai_status_display/O in world) //change status
			spawn( 0 )
			O.mode = 1
			O.emotion = "Neutral"
	return