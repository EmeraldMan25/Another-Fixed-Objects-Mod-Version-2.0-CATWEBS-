if (!launched)
{
    if (global.updating == 0)
    {
        if ((!directory_exists("editor_assets")) || (!file_exists("editor_assets/objects.json")))
        {
            show_message("editor_assets folder is missing from appdata, or data was not extracted successfully. Try re-installing the mod and opening the game again.")
            game_end()
            return;
        }
        global.sprites = ds_map_create()
        global.tilesets = ds_map_create()
        global.audio = ds_map_create()
        global.bgpresets = ds_map_create()
        global.sprite_names = []
        global.tileset_names = []
        global.audio_names = []
        global.bgpreset_names = []
        global.default_sprites = []
        global.default_tilesets = []
        global.default_audio = []
        global.default_bgpresets = []
        global.modFolder = "newTower"
        global.charSelected = 0
        function general_folder_afom(argument0) //gml_Script_general_folder_afom
        {
            return ("towers/" + argument0);
        }

        function mod_folder_afom(argument0) //gml_Script_mod_folder_afom
        {
            return gml_Script_general_folder_afom(((global.modFolder + "/") + argument0));
        }

        function editor_folder_afom(argument0) //gml_Script_editor_folder_afom
        {
            return ("editor_assets/" + argument0);
        }

        global.roomData = undefined
        global.levelName = "test"
        global.editorRoomName = "main"
        global.hubLevel = ""
        global.currentRoom = "main"
        global.currentLevel = global.levelName
        global.fromEditor = 0
        global.fromMenu = 0
        global.editorMemory = struct_new()
        global.towerSelected = 0
        global.editingLevel = 0
        global.editorLevelName = ""
        global.surfaceDestroyer = []
        global.surfaceRoomEnd = []
        global.secretRoomFix = ["main", 0]
	if file_exists("editor_assets/objects.json") {
	    var objectDataThing = file_text_read_all(gml_Script_editor_folder_afom("objects.json"))
            global.objectData = json_parse(objectDataThing)
	}
        if file_exists("editor_assets/objectCompatibility.json")
            global.objectMap = json_parse(file_text_read_all(gml_Script_editor_folder_afom("objectCompatibility.json")))
        else
        {
            show_message("Editor assets is missing objectCompatibility.json, any levels made before this version will load incorrectly and likely crash the game. Try manually adding it to the editor assets folder and open the game again.")
            game_end()
        }
        if (!(variable_struct_exists(global.objectData, "variableTypes")))
            struct_set(global.objectData, [["variableTypes", struct_new(["levelName", "lvl"], ["level", "lvl"], ["targetRoom", "room"])]])
        gml_Script_levelMemory_reset()
        global.editorfont = -1
        function modAssets_extractTowers_afom() //gml_Script_modAssets_extractTowers_afom
        {
            var zips = gml_Script_find_files_recursive(gml_Script_general_folder_afom(""), ".zip", 1)
            for (i = 0; i < array_length(zips); i++)
            {
                zip_unzip(zips[i], gml_Script_general_folder_afom(""))
                file_delete(zips[i])
            }
        }

        gml_Script_modAssets_extractTowers_afom()
        getVersion = http_get("https://api.github.com/repos/GithubSPerez/pt-new-level-editor/releases")
        getLevelDownload = -1
        depth = -1000
        global.defaultTilesets = []
        global.defaultSongs = struct_new()
        global.defaultSong_names = []
        global.defaultSong_display = struct_new()
        global.tilesetData = struct_new()
        global.loadedTileSprite = undefined
        global.loadedTile = undefined
        function switchAssetFolder_afom(argument0) //gml_Script_switchAssetFolder_afom
        {
            global.modFolder = argument0
            ass_unloadAssets()
            if font_exists(global.editorfont)
                font_delete(global.editorfont)
            if (argument0 != "")
                ass_loadFolderAssets(gml_Script_mod_folder_afom(""))
            global.tilesetData = json_parse(file_text_read_all(gml_Script_editor_folder_afom("tilesets.json")))
            var defaultTiles = []
            var defFolderNames = variable_struct_get_names(global.tilesetData.folders)
            for (i = 0; i < array_length(defFolderNames); i++)
            {
                var f = struct_get(global.tilesetData.folders, defFolderNames[i])
                for (var j = 0; j < array_length(f); j++)
                    array_push(defaultTiles, f[j])
            }
            if (array_length(global.tileset_names) > 0)
            {
                global.tilesetData.order = gml_Script_array_concat(["custom"], global.tilesetData.order)
                struct_set(global.tilesetData.folders, [["custom", array_duplicate(global.tileset_names)]])
            }
            ass_loadFolderAssets(gml_Script_editor_folder_afom(""), 1)
            global.defaultTilesets = defaultTiles
            for (i = 0; i < array_length(defaultTiles); i++)
                ass_addTileset(defaultTiles[i], 32, 1, 1, ass_getAutotileList(gml_Script_editor_folder_afom(("autotile/" + defaultTiles[i])), 0), 1)
            global.defaultSongs = struct_new()
            global.defaultSong_names = []
            global.defaultSong_display = struct_new()
            var jt = file_text_read_all(gml_Script_editor_folder_afom("songs.json"))
            var songData = json_parse(jt)
            for (i = 0; i < array_length(songData); i++)
            {
                if (songData[i][0] != "")
                {
                    struct_set(global.defaultSongs, [[songData[i][0], songData[i][1]]])
                    struct_set(global.defaultSong_display, [[songData[i][1], songData[i][0]]])
                }
                array_push(global.defaultSong_names, songData[i][0])
            }
            global.editorfont = font_add_sprite_ext(_spr("smallfont"), "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!.:-<>()_{},[]/\"´¨+=*%^\\~`@#$&'|◊", 0, -1)
	    global.towerlistfont = font_add_sprite_ext(_spr("towerListFont"), "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.:!0123456789?'\"ÁÄÃÀÂÉÈÊËÍÎÏÓÖÕÔÚÙÛÜáäãàâéèêëíîïóöõôúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль%", 0, -20)
        }

        gml_Script_switchAssetFolder_afom("")
        instance_create(x, y, obj_customAudio)
        lpstate = 0
        saveNotice = 0
        launched = 1
    }
    if (!launched)
    {
        global.editorVersion = 6
        var noob = (!file_exists("version"))
        ini_open("version")
        var v = ini_read_string("data", "version", "")
        if (v != currentVersion)
        {  
            var q = show_question("Hey! \"Another Fixed Objects Mod\" mod assets might need to be extracted, which may take a while. This will only happen the first time you open the mod/after an update. If you have custom sprites/other assets you use for the editor, back them up now before they're deleted.\n\nPress Yes to continue")
            if q
            {
                global.updating = 1
                if directory_exists("editor_assets")
                {
                    var prevEditorFiles = gml_Script_find_files_recursive("editor_assets/", "")
                    repeat array_length(prevEditorFiles)
                        file_delete(array_pop(prevEditorFiles))
                    directory_destroy("editor_assets")  
                }
		test = http_get_file("https://github.com/EmeraldMan25/Another-Fixed-Objects-Mod-Version-2.0-CATWEBS-/raw/main/assets/editor_assets.zip", concat(game_save_id, "editor_assets.zip"))
		if (!directory_exists(game_save_id + "towers/00AFOMDeepDishInHell")) 
		{
		    exlevel = http_get_file("https://github.com/EmeraldMan25/Another-Fixed-Objects-Mod-Version-2.0-CATWEBS-/raw/main/assets/00AFOMDeepDishInHell.zip", concat(game_save_id, "towers/", "00AFOMDeepDishInHell.zip"))
		    fetchinglevel = 1
		}
		ini_write_string("data", "version", currentVersion)
            }
            else
                show_message("Stopped extracting mod assets, in case of any issues the mod assets can be manually updated in \"AppData/Roaming/PizzaTower_GM2\"")
            
	    global.started = 1
        }
        else if ((!(directory_exists((game_save_id + "editor_assets")))) || (!(file_exists((game_save_id + "editor_assets/objects.json")))))
        {
            q = show_question("Hey! \"Another Fixed Objects Mod\" mod assets might need to be extracted, which may take a while. This will only happen the first time you open the mod/after an update. If you have custom sprites/other assets you use for the editor, back them up now before they're deleted.\n\nPress Yes to continue")
            if q
            {
                global.updating = 1
                test = http_get_file("https://github.com/EmeraldMan25/Another-Fixed-Objects-Mod-Version-2.0-CATWEBS-/raw/main/assets/editor_assets.zip", concat(game_save_id, "editor_assets.zip"))
		if (!directory_exists(game_save_id + "towers/00AFOMDeepDishInHell")) 
		{
		    exlevel = http_get_file("https://github.com/EmeraldMan25/Another-Fixed-Objects-Mod-Version-2.0-CATWEBS-/raw/main/assets/00AFOMDeepDishInHell.zip", concat(game_save_id, "towers/", "00AFOMDeepDishInHell.zip"))
		    fetchinglevel = 1
		}
            }
            else
                show_message("Stopped extracting mod assets, in case of any issues the mod assets can be manually updated in \"AppData/Roaming/PizzaTower_GM2\"")
            ini_write_string("data", "version", currentVersion)
        }
        else
            global.updating = 0
        ini_close()
    }
}