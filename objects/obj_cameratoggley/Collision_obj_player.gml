if other.key_up2
{
    with (other)
    {
        if (global.smoothcam == 0)
            global.smoothcam = 1
        else
            global.smoothcam = 0
        instance_create(x, y, obj_genericpoofeffect)
        fmod_event_one_shot_3d("event:/sfx/misc/clotheswitch", x, y)
    }
}
if global.smoothcam
    create_transformation_tip("Smooth Camera On")
else
    create_transformation_tip("Smooth Camera Off")
	