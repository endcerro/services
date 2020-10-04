ip =$(../../Scripts/servip.sh)
cat mysql.sql > new.sql
echo "(1, 'siteurl', 'http://"$ip":5050', 'yes'),"
cat 2.sql >> new.sql


# (2, 'home', 'http://192.168.99.160:5050', 'yes'),