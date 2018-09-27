<?php

require __DIR__ . '/../vendor/autoload.php';

// Set up propel
require __DIR__ . '/../generated-conf/config.php';

session_start();

// Instantiate the app
$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);

$files = glob(__DIR__ . '/../src/helpers/*.php');
foreach ($files as $file) {
    require_once $file;   
}

// Set up dependencies
require __DIR__ . '/../src/dependencies.php';

// Register routes
require __DIR__ . '/../src/routes.php';

// Run app
$app->run();
