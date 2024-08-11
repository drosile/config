#!/bin/bash

nmcli -g GENERAL.STATE con show drosile | grep -q 'activ'

if [ $? == 0 ]
then
    printf '{"text": ""}'
else
    printf '{"text": "", "class": "down"}'
fi
