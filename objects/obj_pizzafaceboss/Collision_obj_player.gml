if (state == states.pizzaface_ram && substate == states.pizzaface_ram)
{
	if (other.flash)
		other.flash = false;
	scr_hurtplayer(other);
}
else if ((other.instakillmove || other.state == states.handstandjump) && state == states.stun && savedthrown == thrown && !savedthrown && elitehit == 1)
	scr_boss_do_hurt_phase2(other.id);
