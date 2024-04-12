var _temp_local_var_2, _temp_local_var_3;
function levelsUrl(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_levelsUrl
{
    var page = argument0
    var type = argument1
    var filter = argument2
    var ids = ["22962", "21991"]
    var category = struct_new([["Name", "Custom Levels"], ["ID", ids[argument4]]])
    var subcategory = struct_new([["ID", undefined]])
    var perPage = argument3
    var search = argument5
    var TypeFilter = struct_new([["Mods", 0], ["Sounds", 1], ["WiPs", 2]])
    var FeedFilter = struct_new([["Recent", 0], ["Featured", 1], ["Popular", 2]])
    var url = "https://gamebanana.com/apiv6/"
    var _temp_local_var_2 = type
    if ((type == TypeFilter.Mods))
        url += "Mod/"
    else if ((type == TypeFilter.Sounds))
        url += "Sound/"
    else if ((type == TypeFilter.WiPs))
    {
        category.ID = "1928"
        url += "Wip/"
    }
    if ((search != undefined))
        url += (("ByName?_sName=*" + string(search)) + "*&_idGameRow=7692&")
    else if ((category.ID != undefined))
        url += "ByCategory?"
    else
        url += "ByGame?_aGameRowIds[]=7692&"
    url += ("_csvProperties=_sName,_sModelName,_sProfileUrl,_aSubmitter,_tsDateUpdated,_tsDateAdded,_aPreviewMedia,_sText,_sDescription,_aCategory,_aRootCategory,_aGame,_nViewCount,_nLikeCount,_nDownloadCount,_aFiles,_aModManagerIntegrations,_bIsNsfw,_aAlternateFileSources&_nPerpage=" + string(perPage))
    url += "&_aArgs[]=_sbIsNsfw = false"
    var _temp_local_var_3 = filter
    if ((filter == FeedFilter.Recent))
        url += "&_sOrderBy=_tsDateUpdated,DESC"
    else if ((filter == FeedFilter.Featured))
        url += "&_aArgs[]=_sbWasFeatured = true& _sOrderBy=_tsDateAdded,DESC"
    else if ((filter == FeedFilter.Popular))
        url += "&_sOrderBy=_nDownloadCount,DESC"
    if ((subcategory.ID != undefined))
        url += ("&_aCategoryRowIds[]=" + subcategory.ID)
    else if ((category.ID != undefined))
        url += ("&_aCategoryRowIds[]=" + category.ID)
    url += ("&_nPage=" + string(page))
    return url;
}

