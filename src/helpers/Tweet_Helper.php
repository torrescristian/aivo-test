<?php

use Propel\Runtime\Map\TableMap;

class Tweet_Helper {

    public static function getTweetById(int $id): array {
        $tweet = TweetsQuery::create()
                ->select(['created_at', 'text', 'in_reply'])
                ->findOneById(trim($id));

        if ($tweet) {
            $date = new DateTime($tweet['created_at']);
            // Mon Jun 25 16:03:38 +0000 2018
            $tweet['created_at'] = $date->format('D M d H:i:s O Y');

            // we changes the ID by the user's attributes in $twit['in_reply']
            // and filter the empty users data
            $user = UsersQuery::create()->findOneById($tweet['in_reply']);
            if ($user) {
                $tweet['in_reply'] = $user->toArray(TableMap::TYPE_FIELDNAME);
            } else {
                unset($tweet['in_reply']);
            }
            return $tweet;
        } else {
            return [];
        }
    }

}
