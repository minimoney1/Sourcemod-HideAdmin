#pragma semicolon 1

#include <sourcemod>
#include <colors>
#include "sha/logging.sp"

#define PLUGIN_VERSION "1.0"

new Handle:g_hCvarClientInfoKey = INVALID_HANDLE, 
Handle:g_hCvarEnabled = INVALID_HANDLE,
Handle:g_hCvarLog;

new bool:g_bPluginEnabled,
String:g_strClientInfoKey[256],
bool:g_bLog, 
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
	HookConVarChange((g_hCvarEnabled = CreateConVar("sm_sha_enabled", "1", "Is this plugin enabled?")), OnCvarEnabledChanged);
	HookConVarChange((g_hCvarClientInfoKey = CreateConVar("sm_sha_clientinfo_key", "hide-admin", "The key that clients need to set outside of the server to be marked as hidden.")), OnCvarClientKeyChanged);
	HookConVarChange((g_hCvarLog = CreateConVar("sm_sha_verbose_log", "0", "Create detailed logging of admin hide details?")), OnCvarLogChanged);
	
	
}

public OnConfigsExecuted()
{
	g_bPluginEnabled = GetConVarBool(g_hCvarEnabled);
	g_bLog = GetConVarBool(g_hCvarLog);
	
	GetConVarString(g_hCvarClientInfoKey, g_strClientInfoKey, sizeof(g_strClientInfoKey));
}

public OnCvarEnabledChanged(Handle:conVar, const String:newValue[], const String:oldValue[])
{
	g_bPluginEnabled = StringToInt(newValue) ? true : false;
}

public OnCvarClientKeyChanged(Handle:conVar, const String:newValue[], const String:oldValue[])
{
	strcopy(g_strClientInfoKey, sizeof(g_strClientInfoKey), newValue);
}

public OnCvarLogChanged(Handle:conVar, const String:newValue[], const String:oldValue[])
{
	g_bLog = StringToInt(newValue) ? true : false;
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
			//do stuff
		}
	}
}