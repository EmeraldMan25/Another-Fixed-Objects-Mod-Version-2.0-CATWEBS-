function cutscene_customer_create(argument0, argument1, argument2, argument3, argument4) //gml_Script_cutscene_customer_create
{
    var xx = argument0
    var yy = argument1
    var _idle = argument2
    var _happy = argument3
    var _xscale = argument4
    with (instance_create(xx, yy, obj_customeractor))
    {
        image_xscale = _xscale
        depth = (other.depth - 1)
        sprite_index = _idle
        spr_idle = _idle
        spr_happy = _happy
    }
    cutscene_end_action()
}

