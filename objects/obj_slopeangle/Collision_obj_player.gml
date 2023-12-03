if other.key_up2
{
    with (other)
    {
        if (global.slopeangle == 0)
            global.slopeangle = 1
        else
            global.slopeangle = 0
        instance_create(x, y, obj_genericpoofeffect)
        fmod_event_one_shot_3d("event:/sfx/misc/clotheswitch", x, y)
    }
}
if global.slopeangle
    create_transformation_tip("Slope Angle On")
else
    create_transformation_tip("Slope Angle Off")
	