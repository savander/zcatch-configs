#!/usr/bin/env bash

servers_type="srv_zcatch"
configs=$(ls servers -1a | grep '.cfg')
for cfg in $configs 
do
	#get the number of the server instance
	number=$(grep -o "[0-9][0-9][0-9][0-9]" <<<"servers/$cfg")
	
	echo "Stopping server: $servers_type-$number" 
	
	screen -X -S $servers_type-$number kill
	
	echo "Server stopped" 
done
