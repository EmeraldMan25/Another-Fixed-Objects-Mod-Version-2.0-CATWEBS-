ini_open(("saves/" + concat("AFOMSavedata", ".ini")))
slopeval = ini_read_real("AFOM Settings", "SLOPE ANGLES", 0)
oldtext = ini_read_real("AFOM Settings", "OLD TEXTURES", 0)
panicshd = ini_read_real("AFOM Settings", "HARDMODE", 0)
editormusic = ini_read_real("AFOM Settings", "EDITOR MUSIC", 0)
ini_close()
modSettings[0] = [panicshd, "HARDMODE"]
modSettings[1] = [editormusic, "EDITOR MUSIC"]
modSettings[2] = [slopeval, "SLOPE ANGLES"]
modSettings[3] = [oldtext, "OLD TEXTURES"]
playerid = obj_player.id
selected = 0
active = 0
pressed = 0
destroyed = 0
instance_list = obj_pause.instance_list
sound_list = obj_pause.sound_list
player_index = 0
