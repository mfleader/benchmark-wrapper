#!/bin/bash

es=$1
network_type=$2
query_path=$3
node_id=$4
address=$5
port=$6
runtime=$7
sleep_t=$8
client_max=$9

export es
export es_index="dnsperf-client-loading"

# qty_clients=($(python rsample.py 1 3))
qty_clients=($(echo {1..10}))

# for client in "${qty_clients[@]}"
for client in $(seq 1 1 $client_max);
 do
   echo $client
   python snafu/run_snafu.py --tool dnsperf \
      --runtime-length $runtime \
      --network-type $network_type \
      --queries $query_path \
      --node-id $node_id \
      --client-threads $client \
      --uuid $(uuidgen) \
      --address $address \
      --port $port | \
   tee $network_type.log
   sleep $sleep_t
 done
