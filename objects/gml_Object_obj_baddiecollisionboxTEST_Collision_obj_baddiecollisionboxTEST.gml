if ((object_index != obj_pizzaball))
{
    with (other)
    {
        if (instance_exists(baddieID) && instance_exists(other.baddieID) && (baddieID != other.id) && other.baddieID.killbyenemy)
        {
            if ((baddieID.state == (138 << 0)) && (baddieID.thrown == true))
            {
                instance_destroy(other.baddieID)
                if ((baddieID.pepperman_grab == true))
                    instance_destroy(baddieID)
            }
        }
    }
}
