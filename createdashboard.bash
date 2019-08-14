#!/bin/bash

dash='dashboard.json'

cat header.txt >$dash

count=0

for host in `cat devhosts.txt | sed '$ d'`
do
    echo $count
    cat panel.json | \
    sed "s/\$node/$host/g;s/\$id/$count/" >>$dash
    echo ',' >>$dash
    ((count++))
done

host=`cat devhosts.txt | tail -1`
cat panel.json | \
sed "s/\$node/$host/g;s/\$id/$count/" >>$dash

cat footer.txt >>$dash