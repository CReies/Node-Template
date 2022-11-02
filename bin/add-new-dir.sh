#!bin/sh

if [ -z "$1" ]
then
	echo "Please enter a name for the new directory"
	exit 1
fi

pathTs="\\\t\t\t\"@$1/*\": [\"./src/$1/*\"],"
pathJest="\\\t\t'$1\/(.*)': '<rootDir>/src/$1/\$1',"

mkdir "./src/$1"
sed "/\"@src/ a $pathTs" -i ./tsconfig.json
sed "/src\/(.*)/ a $pathJest" -i ./jest.config.js
