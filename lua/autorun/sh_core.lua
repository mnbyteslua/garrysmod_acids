
/*

Garry's Mod 
Anti-Cheat & Intrusion-Detection System ( ACIDS )

Version : 0.0.1
Last Updated : 6/26/2018

Created By MinnesotaJeb

*/

if ( SERVER ) then

	--------> ENCRYPTION <--------

	function ACIDS_GenerateKey()
	
		Server_Key = ''
	
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
	
	--> CREATE THE ANTICHEAT TIMER <--
	
	function PLAYER:ACIDS_CreateACTimer()
	
		local ID = tostring( self:SteamID64() )
	
	end
	
	--> REMOVE THE ANTICHEAT TIMER <--
	
	function PLAYER:ACIDS_RemoveACTimer()
	
		local ID = tostring( self:SteamID64() )
	
	end

end
