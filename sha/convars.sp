new Handle:g_hCvarClientInfoKey = INVALID_HANDLE, 
Handle:g_hCvarEnabled = INVALID_HANDLE,
Handle:g_hCvarLog;

new bool:g_bCvarPluginEnabled,
String:g_strCvarClientInfoKey[256],
bool:g_bCvarLog;

stock RegisterConVars()
{
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