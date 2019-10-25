#! /bin/bash

repo=$1
pull=$2

curl -H "Authorization: token $(cat token)" \
    https://api.github.com/repos/HokieGeek/$repo/pulls/$pull/comments \
    | jq '.[] | .id' | while read cid; do
    curl -H "Authorization: token $(cat token)"  -X DELETE \
        https://api.github.com/repos/HokieGeek/$repo/pulls/comments/$cid
done
