ip=$(./Scripts/servip.sh)
cat ./Sources/Images/mysql/mysql.sql > ./Sources/Images/mysql/new.sql
echo "(1, 'siteurl', 'http://"$ip":5050', 'yes')," >> ./Sources/Images/mysql/new.sql
echo "(2, 'home', 'http://"$ip":5050', 'yes')," >> ./Sources/Images/mysql/new.sql
cat ./Sources/Images/mysql/2.sql >> ./Sources/Images/mysql/new.sql


# (2, 'home', 'http://192.168.99.160:5050', 'yes'),