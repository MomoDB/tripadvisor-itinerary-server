if [ $(mongo --eval 'db.getMongo().getDBNames().indexOf("tours")' --quiet) -lt 0 ]; then
  echo "snaketours doesn't exist"
  echo "creating new database..."
  time mongoimport --db snaketours --collection tours --file /Users/joeynguyen/tripadvisor-itenerary-server/seeder/Mongoose/mongo_fakeData/mongo_tours.json --type json
else
  echo "snaketours exists"
  mongo snaketours --eval "db.dropDatabase()"
  echo "database dropped"
  time mongoimport --db snaketours --collection tours --file /Users/joeynguyen/tripadvisor-itenerary-server/seeder/Mongoose/mongo_fakeData/mongo_tours.json --type json
fi