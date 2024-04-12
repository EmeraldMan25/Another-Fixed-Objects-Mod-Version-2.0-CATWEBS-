function autotile_new() //gml_Script_autotile_new
{
    var atData = []
    for (var i = 0; i < 10; i++)
    {
        atData[i] = []
        for (var j = 0; j < 5; j++)
            atData[i][j] = [i, j]
    }
    return atData;
}

function autotile_save(argument0, argument1) //gml_Script_autotile_save
{
    var atData = argument0
    var buff = buffer_create(100, buffer_fast, 1)
    for (var i = 0; i < 10; i++)
    {
        for (var j = 0; j < 5; j++)
        {
            var atdCoord = atData[i][j]
            buffer_write(buff, buffer_u8, atdCoord[0])
            buffer_write(buff, buffer_u8, atdCoord[1])
        }
    }
    buffer_save(buff, argument1)
}

function autotile_load(argument0) //gml_Script_autotile_load
{
    var aData = []
    if (!file_exists(argument0))
        return autotile_new();
    var buff = buffer_load(argument0)
    for (var i = 0; i < 10; i++)
    {
        aData[i] = []
        for (var j = 0; j < 5; j++)
        {
            var xCoord = buffer_read(buff, buffer_u8)
            var yCoord = buffer_read(buff, buffer_u8)
            aData[i][j] = [xCoord, yCoord]
        }
    }
    return aData;
}

function at_collCheck(argument0, argument1, argument2) //gml_Script_at_collCheck
{
    return argument0[(argument1 + 2)][(argument2 + 2)];
}

function autotile_vars() //gml_Script_autotile_vars
{
    at_outRules = [[[2, 0, 2], [0, 1, 1], [2, 1, 2]], [[2, 0, 2], [1, 1, 1], [2, 1, 2]], [[2, 0, 2], [1, 1, 0], [2, 1, 2]], [[2, 1, 2], [0, 1, 1], [2, 1, 2]], [[1, 1, 1], [1, 1, 1], [1, 1, 1]], [[2, 1, 2], [1, 1, 0], [2, 1, 2]], [[2, 1, 2], [0, 1, 1], [2, 0, 2]], [[2, 1, 2], [1, 1, 1], [2, 0, 2]], [[2, 1, 2], [1, 1, 0], [2, 0, 2]], [[2, 1, 2], [1, 1, 1], [2, 1, 0]], [[2, 1, 2], [1, 1, 1], [0, 1, 2]], [[2, 1, 0], [1, 1, 1], [2, 1, 2]], [[0, 1, 2], [1, 1, 1], [2, 1, 2]]]
    at_inRules = [[[2, 2, 2, 2, 2], [2, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 1, 1, 1, 1]], [[0, 0, 0, 0, 0], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[2, 2, 2, 2, 2], [1, 1, 1, 1, 2], [1, 1, 1, 1, 2], [1, 1, 1, 1, 2], [1, 1, 1, 1, 2]], [[0, 1, 1, 1, 1], [0, 1, 1, 1, 1], [0, 1, 1, 1, 1], [0, 1, 1, 1, 1], [0, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 0], [1, 1, 1, 1, 0], [1, 1, 1, 1, 0], [1, 1, 1, 1, 0], [1, 1, 1, 1, 0]], [[2, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 2, 2, 2, 2]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [0, 0, 0, 0, 0]], [[1, 1, 1, 1, 2], [1, 1, 1, 1, 2], [1, 1, 1, 1, 2], [1, 1, 1, 1, 2], [2, 2, 2, 2, 2]]]
}

function autotile_getCollArray(argument0, argument1, argument2, argument3) //gml_Script_autotile_getCollArray
{
    var halfSide = floor((argument3 / 2))
    var coll = []
    for (var i = 0; i < argument3; i++)
    {
        coll[i] = []
        for (var j = 0; j < argument3; j++)
        {
            coll[i][j] = 0
            var xCheck = int64((argument1 + ((i - halfSide) * 32)))
            var yCheck = int64((argument2 + ((j - halfSide) * 32)))
            var tString = ((string(xCheck) + "_") + string(yCheck))
            if variable_struct_exists(argument0, tString)
            {
                var tile = struct_get(argument0, tString)
                if ((tile.tileset == tilesetSelected))
                {
                    var sameInd = 1
                    if (variable_struct_exists(tile, "autotile_index") && variable_struct_exists(tile, "autotile"))
                    {
                        if (tile.autotile && (tile.autotile_index != tileset_autotileIndex))
                            sameInd = 0
                    }
                    coll[i][j] = sameInd
                }
            }
            var dat = obj_rmEditor.data
            var prop = dat.properties
            if ((xCheck < prop.roomX) || (xCheck >= prop.levelWidth) || (yCheck < prop.roomY) || (yCheck >= prop.levelHeight))
                coll[i][j] = 1
        }
    }
    return coll;
}

function autotile_isInside(argument0) //gml_Script_autotile_isInside
{
    autotile_vars()
    var coll = argument0
    for (var i = 0; i < array_length(at_inRules); i++)
    {
        var success = 1
        var tx = 0
        while ((tx < 5) && success)
        {
            var ty = 0
            while ((ty < 5) && success)
            {
                var arr = at_inRules[i][ty]
                if ((coll[tx][ty] != arr[tx]) && (arr[tx] != 2))
                    success = 0
                ty++
            }
            tx++
        }
        if success
            return 1;
    }
    return 0;
}

function autotile_getCoords(argument0, argument1, argument2, argument3, argument4) //gml_Script_autotile_getCoords
{
    autotile_vars()
    var result = [0, 0]
    var coll = autotile_getCollArray(argument0, argument1, argument2, 5)
    var bigColl = autotile_getCollArray(argument0, argument1, argument2, 7)
    var xx = argument1
    var yy = argument2
    if ((argument3 == undefined))
        argument3 = autotile_new()
    var foundInd = -1
    var onInside = 0
    var i = 0
    while ((i < array_length(at_outRules)) && (foundInd == -1))
    {
        var success = 1
        var tx = 0
        while ((tx < 3) && success)
        {
            var ty = 0
            while ((ty < 3) && success)
            {
                var arr = at_outRules[i][ty]
                if ((coll[(tx + 1)][(ty + 1)] != arr[tx]) && (arr[tx] != 2))
                    success = 0
                ty++
            }
            tx++
        }
        if success
            foundInd = i
        i++
    }
    if ((foundInd == -1))
        return argument3[7][2];
    if ((foundInd == 4))
    {
        onInside = autotile_isInside(coll)
        if onInside
        {
            var inColl = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
            inColl = argument4
            var foundit = 0
            i = 0
            while ((i < array_length(at_outRules)) && (!foundit))
            {
                success = 1
                tx = 0
                while ((tx < 3) && success)
                {
                    ty = 0
                    while ((ty < 3) && success)
                    {
                        arr = at_outRules[i][ty]
                        if ((inColl[tx][ty] != arr[tx]) && (arr[tx] != 2))
                            success = 0
                        ty++
                    }
                    tx++
                }
                if success
                {
                    foundInd = i
                    foundit = 1
                }
                i++
            }
        }
    }
    if (onInside && (foundInd == -1))
    {
        onInside = 0
        foundInd = 4
    }
    var r = irandom_range(1, 3)
    var resultList = []
    if (!onInside)
        resultList = [[0, 0], [r, 0], [4, 0], [0, r], [7, 2], [4, r], [0, 4], [r, 4], [4, 4], [6, 1], [8, 1], [6, 3], [8, 3]]
    else
        resultList = [[1, 1], [2, 1], [3, 1], [1, 2], [2, 2], [3, 2], [1, 3], [2, 3], [3, 3], [5, 0], [9, 0], [5, 4], [9, 4]]
    result = resultList[foundInd]
    return argument3[result[0]][result[1]];
}

function editor_autotile(argument0, argument1, argument2) //gml_Script_editor_autotile
{
    if ((argument0 < 2))
    {
        for (var xx = 0; xx < argument1; xx++)
        {
            for (var yy = 0; yy < argument2; yy++)
            {
                if argument0
                    addTile(tilesetSelected, [0, 0], (x + (xx * gridSize)), (y + (yy * gridSize)), 1)
                else
                    deleteTile((x + (xx * gridSize)), (y + (yy * gridSize)))
            }
        }
    }
    var tm = _stGet(("data.tile_data." + string(layer_tilemap)))
    var tString = ((string(x) + "_") + string(y))
    var autoData = []
    var collArrays = []
    var positions = []
    var isInside = []
    var isAuto = []
    for (xx = 0; xx < (6 + argument1); xx++)
    {
        collArrays[xx] = []
        isInside[xx] = []
        pos[xx] = []
        isAuto[xx] = []
        for (yy = 0; yy < (6 + argument2); yy++)
        {
            collArrays[xx][yy] = undefined
            positions[xx][yy] = [0, 0]
            isInside[xx][yy] = 0
            isAuto[xx][yy] = 0
            var checkX = int64((x + ((xx - 3) * gridSize)))
            var checkY = int64((y + ((yy - 3) * gridSize)))
            tString = ((string(checkX) + "_") + string(checkY))
            if variable_struct_exists(tm, tString)
            {
                var currTile = struct_get(tm, tString)
                if ((currTile.tileset == tilesetSelected))
                {
                    collArrays[xx][yy] = autotile_getCollArray(tm, checkX, checkY, 5)
                    positions[xx][yy] = [checkX, checkY]
                    isInside[xx][yy] = autotile_isInside(collArrays[xx][yy])
                    if variable_struct_exists(currTile, "autotile")
                    {
                        var sameInd = 1
                        if variable_struct_exists(currTile, "autotile_index")
                        {
                            if ((currTile.autotile_index != tileset_autotileIndex))
                                sameInd = 0
                        }
                        isAuto[xx][yy] = (currTile.autotile && sameInd)
                    }
                }
            }
            var dat = obj_rmEditor.data
            var prop = dat.properties
            if ((checkX < prop.roomX) || (checkX >= prop.levelWidth) || (checkY < prop.roomY) || (checkY >= prop.levelHeight))
            {
                collArrays[xx][yy] = autotile_getCollArray(tm, checkX, checkY, 5)
                positions[xx][yy] = [checkX, checkY]
                isInside[xx][yy] = autotile_isInside(collArrays[xx][yy])
                isAuto[xx][yy] = 0
            }
        }
    }
    for (xx = 0; xx < (4 + argument1); xx++)
    {
        for (yy = 0; yy < (4 + argument2); yy++)
        {
            if ((collArrays[(xx + 1)][(yy + 1)] != undefined))
            {
                if isAuto[(xx + 1)][(yy + 1)]
                {
                    var pos = positions[(xx + 1)][(yy + 1)]
                    var inColl = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
                    if isInside[(xx + 1)][(yy + 1)]
                    {
                        for (var i = 0; i < 3; i++)
                        {
                            for (var j = 0; j < 3; j++)
                                inColl[i][j] = isInside[(xx + i)][(yy + j)]
                        }
                    }
                    var coords = autotile_getCoords(tm, pos[0], pos[1], tilesetStruct.autotile[tileset_autotileIndex], inColl)
                    addTile(tilesetSelected, coords, pos[0], pos[1], 1)
                }
            }
        }
    }
}

