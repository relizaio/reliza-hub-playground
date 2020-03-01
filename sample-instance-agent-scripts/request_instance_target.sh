#!/bin/bash

## $1 - reliza hub instance api id, $2 - reliza hub instance api key
# require at least 2 params
if [ "$#" -lt 2 ]
then
        echo "Usage: api_id api_key"
        exit 1
fi

docker run --rm relizaio/reliza-go-client getmyrelease -u https://playground.relizahub.com -i $1 -k $2