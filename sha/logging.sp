#include <sourcemod>

public LogAdminAction(Handle:hPlugin, numParams)
{
	new client = GetNativeCell(1),
	adminLogType:type = GetNativeCell(3),
	bool:bGivenMessage = GetNativeCell(2) ? true : false;
	
	decl String:strGivenMessage[512];
	
	if (bGivenMessage)
	{
		new givenMessage_maxLength;
		GetNativeStringLength(4, givenMessage_maxLength);
		GetNativeString(4, strGivenMessage, sizeof(strGivenMessage));
	}
	else
		strGivenMessage[0] = '\0';
	
	
}