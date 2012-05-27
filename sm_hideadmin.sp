#pragma semicolon 1

#include <sourcemod>
#include <colors>
#include "sha/logging.sp"
#include "sha/convars.sp"
#include "sha/natives.sp"

#define PLUGIN_VERSION "1.0"
#define LOG_PATH "logs/hide-admin.log"

new bool:g_bPluginLate,
bool:g_bIsClientHidden[MAXPLAYERS+1];

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
	CreateConVar("sm_sha_version", PLUGIN_VERSION, "The version of the plugin", FCVAR_DONTRECORD|FCVAR_REPLICATED|FCVAR_NOTIFY);	
}

public AskPluginLoad2(Handle:myself, bool:late, String:error[], err_max)
{
	g_bPluginLate = late;
	RegisterNatives();
}

public Action:OnClientPreAdminCheck(client)
{
	if (g_bPluginEnabled)
	{
		decl String:clientInfo[256];
		GetClientInfo(client, g_strClientInfoKey, clientInfo, sizeof(clientInfo));
		g_bIsClientHidden[client] = StringToInt(clientInfo) ? true : false;
		if (g_bIsClientHidden[client])
		{
			if (g_bLog)
			{
				
			}
		}
		else
		{
			return Plugin_Continue;
		}
	}
}