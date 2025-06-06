#!/data/data/com.termux/files/usr/bin/bash

host="1.1.1.1"
min=1200
max=1472

while [ $min -le $max ]; do
    mid=$(( (min + max) / 2 ))
    if ping -s $mid -M do -c 1 $host > /dev/null 2>&1; then
        min=$((mid + 1))
    else
        max=$((mid - 1))
    fi
done

echo "Best MTU payload: $max"
echo "Recommended MTU: $((max + 28))"
