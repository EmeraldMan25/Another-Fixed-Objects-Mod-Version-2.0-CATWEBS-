function scr_add_grannypizzaboss(argument0, argument1, argument2) //gml_Script_scr_add_grannypizzaboss
{
    var q = scr_add_grannypizzalevel(argument1, argument2, false, false, false, true)
    ini_open_from_string(obj_savesystem.ini_str)
    if ((ini_read_real(argument0, "unlocked", false) == false))
        array_pop(levelarray)
    ini_close()
}

function scr_add_grannypizzalevel(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_add_grannypizzalevel
{
    if ((argument2 == undefined))
        argument2 = true
    if ((argument3 == undefined))
        argument3 = true
    if ((argument4 == undefined))
        argument4 = true
    if ((argument5 == undefined))
        argument5 = true
    var q = 
    {
        icon: argument1,
        secrets: argument2,
        secretcount: 0,
        toppins: argument3,
        toppinarr: [false, false, false, false, false],
        treasure: argument4,
        gottreasure: false,
        rank: argument5,
        gotrank: -4
    }

    ini_open_from_string(obj_savesystem.ini_str)
    if q.secrets
        q.secretcount = ini_read_real("Secret", argument0, 0)
    if q.toppins
    {
        for (var i = 0; i < array_length(q.toppinarr); i++)
            q.toppinarr[i] = ini_read_real("Toppin", concat(argument0, (i + 1)), false)
    }
    if q.treasure
        q.gottreasure = ini_read_real("Treasure", argument0, false)
    if q.rank
        q.gotrank = ini_read_string("Ranks", argument0, "none")
    ini_close()
    array_push(levelarray, q)
    return q;
}

