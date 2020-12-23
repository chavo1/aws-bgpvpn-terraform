#!/usr/bin/env bash

scp -i ~/.ssh/id_rsa clean mimi@192.168.2.1:/tmp/clean

cat <<EOF | ssh -tt mimi@192.168.2.1 | grep -v -e secret -e password
configure
load /tmp/clean
commit
exit discard
exit
EOF