// Tasimacilik Sistemi

#include 	<a_samp>
#include    <zcmd>

new TasimacilikCP[MAX_PLAYERS];

public OnFilterScriptInit()
{
	print("Tasimacilik sistemi yuklendi - R4IN");
	CreatePickup(1239, 23, 2024.5842,1419.9708,10.8203);
	Create3DTextLabel("{fff000}[Tasimacilik Sistemi]\nTasimacilik baslamak icin /tasimacilik yaziniz.", -1, 2024.5842,1419.9708,10.8203, 8.0, 0);
	AddStaticVehicle(414, 2027.4897,1428.2587,10.8130,357.2526, 1, 1);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return true;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(TasimacilikCP[playerid] == 1)
	{
	    TasimacilikCP[playerid] = 2;
	    SetPlayerCheckpoint(playerid, 2260.5178,1530.6992,10.7734,4.0);
	}
	else if(TasimacilikCP[playerid] == 2)
	{
	    TasimacilikCP[playerid] = 3;
	    SetPlayerCheckpoint(playerid, 2414.7852,1492.3729,10.9206,4.0);
	}
	else if(TasimacilikCP[playerid] == 3)
	{
	    SendClientMessage(playerid, -1, "Basarili sekilde meslegi tamamladiniz.");
	    DisablePlayerCheckpoint(playerid);
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

CMD:tasimacilik(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 4.0, 2024.5842,1419.9708,10.8203))
	{
 		SendClientMessage(playerid, -1, "Meslege katildiniz.");
 		SetPlayerCheckpoint(playerid, 2096.5110,1530.7263,10.7655,4.0);
 		TasimacilikCP[playerid] = 1;
	}
	else
	{
 		SendClientMessage(playerid, -1, "Meslek yerine oldukça uzaktasiniz!");
	}
	return true;
}
