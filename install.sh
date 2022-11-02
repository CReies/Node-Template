#!bin/sh

pnpm i;
mv ./.env.example ./.env.a

while getopts n:d:m: flag
do
	case "${flag}" in
		n) name=${OPTARG};;
		d) description=${OPTARG};;
		m) main=${OPTARG};;
	esac
done

if [ -z "$name" ]
then
	name="$( basename "$( pwd; )" )"
fi

if [ -z "$description" ]
then
	description="Project generated with https://github.com/CReies/Node-Template.git"
fi

if [ -z "$main" ]
then
	main="index"
fi

sed "2d;4d;5d" -i ./package.json
sed "1 a \\\t\"name\": \"$name\"," -i ./package.json
sed "3 a \\\t\"description\": \"$description\"," -i ./package.json
sed "4 a \\\t\"main\": \"$main.ts\"," -i ./package.json
