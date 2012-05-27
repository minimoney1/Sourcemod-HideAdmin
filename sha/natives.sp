#include <sourcemod>

stock RegisterNatives()
{
	CreateNative("SHA_LogAdminAction", LogAdminAction);
	
}