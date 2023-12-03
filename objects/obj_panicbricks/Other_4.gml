if (global.panic = true)
{
    var debris = layer_create(-350, "panicbricks_escape")
    var create = layer_background_create(debris, bg_fallingbricksforefront)
    layer_background_htiled(create, 1)
    layer_background_vtiled(create, 1)
    layer_vspeed(debris, 4)
}