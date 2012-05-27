#include <sourcemod>

enum adminLogType
{
	admLogType_Join = 1,
	admLogType_Command,
	admLogType_Disconnect,
	admLogType_Unknown
}

/**
 * 
 * Logs an admin action through the SHA verbose logging system.
 * 
 * 
 * @param client			The client id of the admin being logged.
 * @param type				The type of admin logging as listed in the adminLogType enumeration.
 * @param bGivenMessage		Is a custom message given?
 * @param strGivenMessage	String containing the given message.
 * 
 * @note This native is mostly for use of plugins that integrate directly with SHA.
 * 
 */
native SHA_LogAdminAction(client, adminLogType:type = admLogType_Unknown, bool:bGivenMessage, const String:strGivenMessage[]);