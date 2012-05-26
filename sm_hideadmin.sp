#include <sourcemod>
#include <colors>

#define PLUGIN_VERSION "1.0"

public Plugin:myinfo = 
{
	name = "Sourcemod Hide Admin",
	author = "Mini",
	description = "Allows admins to hide their identity while providing an interface for other plugins to use.",
	version = PLUGIN_VERSION,
	url = "http://forums.alliedmods.net"
}

public OnPluginStart()
{
	CreateConVar("sm_sha_version", PLUGIN_VERSION, "The version of the plugin");
}
