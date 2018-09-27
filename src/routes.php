<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Propel\Runtime\Map\TableMap;
use Propel\Runtime\ActiveQuery\Criteria;

// Routes
$app->get('/tweets/{id:[0-9]+}', function (Request $request, Response $response, array $args) {
    $tweet = Tweet_Helper::getTweetById($args['id']);
    return $tweet ? $response->withJson($tweet) : $response->withStatus(404);
});

$app->get('/tweets', function (Request $request, Response $response, array $args) {
    $tweetsPropel = TweetsQuery::create()
            ->limit(10)
            ->orderByCreatedAt(Criteria::DESC)
            ->find();

    $tweets = [];
    foreach ($tweetsPropel as $tweetPropel) {
        $tweet = $tweetPropel->toArray(TableMap::TYPE_FIELDNAME);
        $tweets[] = Tweet_Helper::getTweetById($tweet['id']);
    }

    return $response->withJson($tweets);
});

$app->get('/', function (Request $request, Response $response, array $args) {
    return $this->renderer->render($response, 'index.php', $args);
});
