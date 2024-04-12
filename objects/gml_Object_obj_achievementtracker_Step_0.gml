for (var i = 0; i < array_length(achievements_update); i++)
{
    var b = achievements_update[i]
    with (b)
    {
        if (!unlocked)
        {
            if ((frames >= update_rate))
            {
                frames = 0
                self.update_func()
            }
            frames++
        }
    }
}
while (!ds_queue_empty(notify_queue))
{
    b = ds_queue_dequeue(notify_queue)
    for (i = 0; i < array_length(achievements_notify); i++)
    {
        var q = achievements_notify[i]
        with (q)
        {
            if (!unlocked)
                self.func(b)
        }
    }
}
if ((!ds_queue_empty(unlock_queue)) && (!instance_exists(obj_cheftask)))
{
    b = ds_queue_dequeue(unlock_queue)
    with (instance_create(0, 0, obj_cheftask))
    {
        achievement_spr = b[0]
        achievement_index = b[1]
    }
    repeat (10)
        instance_create((obj_screensizer.actual_width - 100), (obj_screensizer.actual_height - 50), obj_confettieffect)
}
if instance_exists(obj_player1)
    ispeppino = obj_player1.ispeppino
if global.swapmode
    ispeppino = false
