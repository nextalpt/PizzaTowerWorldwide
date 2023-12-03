with (other)
{
	if (character == "P")
		character = "V";
	else
		character = "P";
	respawn = 200;
	scr_characterspr();
	instance_destroy(other);
}
