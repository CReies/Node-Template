#!bin/sh

pnpm i;
mv ./.env.example ./.env

while getopts n:d:m:u:r flag
do
	case "${flag}" in
		n) name=${OPTARG};;
		d) description=${OPTARG};;
		m) main=${OPTARG};;
		u) user=${OPTARG};;
		r) repo=${OPTARG};;
	esac
done

if [ -z "$name" ]
then
	name="$( basename "$( pwd; )" | tr '[:upper:]' '[:lower:]')" 
fi

if [ -z "$description" ]
then
	description="Project generated with https://github.com/CReies/Node-Template.git"
fi

if [ -z "$main" ]
then
	main="index"
fi

if [ -z "$user" ]
then
	echo "Enter your github user"
	exit 1
fi

if [ -z "$repo" ]
then
	repo="$( basename "$( pwd; )" )"
fi

sed "2d;4d;5d;8d;19d" -i ./package.json
sed "1 a \\\t\"name\": \"$name\"," -i ./package.json
sed "3 a \\\t\"description\": \"$description\"," -i ./package.json
sed "4 a \\\t\"main\": \"src\/$main.ts\"," -i ./package.json
sed	"7 a \\\t\"start:prod\": \"node -r ts-node/register/transpile-only -r tsconfig-paths/register ./dist/src/$main.js\"," -i package.json
sed	"18 a \\\t\t\"url\": \"https:\/\/github.com\/$user\/$repo.git\"" -i package.json

sed "5d" -i ./nodemon.json
sed "4 a \\\t\"exec\": \"ts-node -r tsconfig-paths/register ./src/$main.ts\"," -i ./nodemon.json
