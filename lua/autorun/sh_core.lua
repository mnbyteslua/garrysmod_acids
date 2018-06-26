
/*

Garry's Mod 
Anti-Cheat & Intrusion-Detection System ( ACIDS )

Version : 0.0.1
Last Updated : 6/26/2018

Created By mnbytes_

*/

if ( SERVER ) then

	--------> ENCRYPTION <--------

	function ACIDS_GenerateKey()
	
		local USED_CHARACTERS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
	
		local INT1 = tostring( math.floor( math.Rand( 0, 1000000 ) ) )
		local INT2 = tostring( math.floor( math.Rand( 0, 1000000 ) ) )
		local INT3 = tostring( math.floor( math.Rand( 0, 1000000 ) ) )
		local INT4 = tostring( math.floor( math.Rand( 0, 1000000 ) ) )
		local INT5 = tostring( math.floor( math.Rand( 0, 1000000 ) ) )
		local INT6 = tostring( math.floor( math.Rand( 0, 1000000 ) ) )
	
	end
	
	hook.Add( 'Initialize', 'GenerateServersKey', function()
	
		ACIDS_GenerateKey()
	
	end )
	
	function ACIDS_VerifyKey( key )
	
		local String_Key = tostring( key )
		
		if ( String_Key = Server_Key ) then
		
			print( '[ ACIDS ] A Key Query Has Been SUCCESSFULLY Verified' )
		
			return true
		
		else
		
			print( '[ ACIDS ] A Key Query Has Been UNSUCCESSFULLY Verified' )
		
			return false
		
		end
	
	end
	
	--------> ANTICHEAT <--------
	
	local PLAYER = FindMetaTable( 'Player' )
	
	--> SETUP NETWORKING <--
	
	hook.Add( 'Initialize', 'SetupACNetworking', function()
	
		util.AddNetworkString( 'ACIDS_PerformACScan' )
		util.AddNetworkString( 'ACIDS_PositiveResults' )
		
		print( '[ ACIDS ] AntiCheat Networking Setup Completed' )
	
	end )
	
	--> CREATE THE ANTICHEAT TIMER <--
	
	function PLAYER:ACIDS_CreateACTimer()
	
		local ID = tostring( self:SteamID64() )
		
		timer.Create( 'ACIDS_ACTimer_' .. ID, 0, 0, function()
		
			net.Start( 'ACIDS_PerformACScan' )
			net.Send( ply )
		
		end )
		
		print( '[ ACIDS ] ' .. self:Name() .. "'s AntiCheat Timer Has Been Created" )
	
	end
	
	hook.Add( 'PlayerInitialSpawn', 'CreateACTimer', function( ply )
	
		ply:ACIDS_CreateACTimer()
	
	end )
	
	--> REMOVE THE ANTICHEAT TIMER <--
	
	function PLAYER:ACIDS_RemoveACTimer()
	
		local ID = tostring( self:SteamID64() )
		
		timer.Remove( 'ACIDS_ACTimer_' .. ID )
		
		print( '[ ACIDS ] ' .. self:Name() .. "'s AntiCheat Timer Has Been Removed" )
	
	end
	
	hook.Add( 'PlayerDisconnected', 'RemoveACTimer', function( ply )
	
		ply:ACIDS_RemoveACTimer()
	
	end )

end
