#!/bin/bash
which docker &>/dev/null
if [ $? -eq 0 ];
then
echo "docker is install"
else
echo "docker is not install"
fi
