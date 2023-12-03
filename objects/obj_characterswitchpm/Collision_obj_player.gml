with (other)
{
	if (character == "P")
		character = "M";
	else
		character = "P";
	respawn = 200;
	scr_characterspr();
	instance_destroy(other);
}
