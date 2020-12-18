#!/bin/bash
if [ ! -x solitaire.py ]; then
	echo "Could not find solitaire.py with executable permission"
	exit 1
fi
if [ $# -ne 3 ]; then
	echo "Command requires 3 arguments: Usage run_solitaire.bash [max faces] [max suits] [trials]"
	exit 1
fi
intregrex= '^[0-9]+$'
if ! [[ $1 =~ $intregex ]] || ! [[ $2 =~ $intregex ]] || ! [[ $3 =~ $intregex ]]; then
	echo "One of the arguments isnot an integer: $1 $2 $3"
	exit 1
fi
if [ $1 -gt 15 ] || [ $2 -gt 8 ]; then
	echo "Limited to no more than 15 faces or 8 suits"
	exit 1
fi
if [ $3 -gt 100000 ]; then
	echo "Limited to no more than 100000 trials"
	exit 1
fi
echo "F S   %win"
faces=2
while [ $faces -le $1 ]; do
	suits=2
	while [ $suits -le $2 ]; do
		let ncards=faces*suits
		let odd=ncards%2
		if [ $odd -ne 1 ]; then
			echo -n $faces $suits
			./solitaire.py $faces $suits $3 | colrm 1 21
		fi
		let suits++
	done
	let faces++
done
