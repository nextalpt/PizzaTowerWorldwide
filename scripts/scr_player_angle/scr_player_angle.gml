function scr_player_angle(){
if state == (121 << 0) || state == 0 || state == (94 << 0) || state == (91 << 0) || state == (104 << 0) || state == (105 << 0) || state == (5 << 0) || state == (99 << 0) || state == (100 << 0)
    {
        if grounded && !place_meeting(x, (y + 1), obj_solid)
        {
            if scr_slope()
            {
                var AngleAffect = 1.5
                var Slope = instance_place(x, (y + 1), obj_slope)
                var SlopeXscale = abs(Slope.image_xscale)
                var SlopeYscale = abs(Slope.image_yscale) / AngleAffect 
                var targetAngle = ((50 / (SlopeXscale / SlopeYscale)) * (sign(Slope.image_xscale) / (sign(Slope.image_yscale))))
                angle = lerp(angle, targetAngle, 0.5)
            }
            else
                angle = lerp(angle, 0, 0.5)
        }
        else
            angle = lerp(angle, 0, 0.5)
    }
    else 
        angle = lerp(angle, 0, 0.5)
}