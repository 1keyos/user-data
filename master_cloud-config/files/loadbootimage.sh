#!/bin/bash
listdocker=` ls /images  | grep -v ^rkt`
for((i = 0;i < ${#listdocker[@]};i++ ))
{
 docker load /images/${listdocker[i]}

}

