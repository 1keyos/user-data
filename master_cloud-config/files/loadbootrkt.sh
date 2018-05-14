#!/bin/bash

rktlistdocker=`ls /images | grep rkt`


for((i = 0;i < ${#rktlistdocker[@]};i++ ))
{
 rkt --insecure-options=image  image  fetch file:///images/${rktlistdocker[i]}

}
