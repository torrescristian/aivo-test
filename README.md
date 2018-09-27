# Set up

1. install the vendors
```
composer install
```

2. run the SQL statements in ./queries.sql
  - set the values of the user and password on ./generated-conf/config.php
  ```
  [
    'user' => 'root',
    'password' => '',
  ]
  ```
  - if you database can't be named as 'aivo' then:
    + rename it on ./queries.sql -> CREATE DATABASE [name]
    + rename it on ./generated-conf/config.php -> 'dsn' => '(...);dbname=[name]'
