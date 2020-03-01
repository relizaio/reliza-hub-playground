#!/bin/bash
## $1 - reliza hub instance api id, $2 - reliza hub instance api key
# require at least 2 params
if [ "$#" -lt 2 ]
then
        echo "Usage: api_id api_key"
        exit 1
fi


# for real use case on k8s use the following to obtain all images deployed on k8s
# kubectl get pods --all-namespaces -o jsonpath="{.items[*].status.containerStatuses[0].imageID}"

docker pull relizaio/reliza-go-client
docker run --rm relizaio/reliza-go-client instdata -u https://playground.relizahub.com -i $1 -k $2 --images "sha256:c10779b369c6f2638e4c7483a3ab06f13b3f57497154b092c87e1b15088027a5 sha256:e6c2bcd817beeb94f05eaca2ca2fce5c9a24dc29bde89fbf839b652824304703"


# it is also possible to send image data from file, i.e.
# mkdir /tmp/temp_agent_data
# kubectl get pods --all-namespaces -o jsonpath="{.items[*].status.containerStatuses[0].imageID}" > /tmp/temp_agent_data/images.txt 2>&1
# docker run --rm -v /tmp/temp_agent_data:/app/localdata relizaio/reliza-go-client instdata -i $1 -k $2 -f /app/localdata/images.txt
# rm -rf /tmp/temp_agent_data