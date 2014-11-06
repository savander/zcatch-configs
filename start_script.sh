#!/usr/bin/env bash
servers_type="srv_zcatch"
configs=$(ls servers -1a | grep '.cfg')
for cfg in $configs 
do
	#get the sv_port from the file
	port=$(grep 'sv_port' servers/$cfg)
	
	#remove sv_port string
	port="${port//sv_port/}"
	
	number=$(grep -o "[0-9][0-9][0-9][0-9]" <<<"servers/$cfg")
	
	echo "Starting server: $servers_type-$number on port:$port" 
	
	screen -S $servers_type-$number -dm ./restart.sh $port ./zCatch_srv_sql -f ./servers/$cfg
	
	echo "Startup completed" 
done
