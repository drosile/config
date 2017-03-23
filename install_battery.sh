#!/bin/bash

mkdir -p $HOME/bin
cd $HOME/bin && {
  curl -O https://raw.githubusercontent.com/goles/battery/master/battery
  chmod u+x $HOME/bin/battery
}
