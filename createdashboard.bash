#!/bin/bash

dash='dashboard.json'

cat header.txt >$dash

count=0

for host in `cat devhosts.txt | sed '$ d'`
do
    cat panel.txt | \
    sed "s/\$node/$host/g;s/\$id/$count/" >>$dash
    echo ',' >>$dash
    ((count++))
done

host=`cat devhosts.txt | tail -1`
cat panel.txt | \
sed "s/\$node/$host/g;s/\$id/$count/" >>$dash

cat footer.txt >>$dash
