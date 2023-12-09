with (other)
{
	if (character == "P")
		character = "G";
	else
		character = "P";
	respawn = 200;
	scr_characterspr();
	instance_destroy(other);
}
