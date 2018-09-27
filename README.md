# aivo-test

## Set up

1. install the vendors
```
composer install
```

2. run the SQL statements in ./queries.sql

3. set the values of the user and password on ./generated-conf/config.php
```
[
  // ...
  'user' => 'root',
  'password' => '',
  // ...
]
```
4. if your database can't be named as 'aivo' then:
  + rename it on ./queries.sql -> CREATE DATABASE [name]
  + rename it on ./generated-conf/config.php -> 'dsn' => '(...);dbname=[name]'

5. use and test
```
composer start
```
```
composer run test
```

## URIs

### /tweets

returns the last ten tweets of a twitter account

### /tweets/{id}

return a tweet selected by the ID