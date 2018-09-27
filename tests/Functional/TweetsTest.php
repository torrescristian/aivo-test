<?php

namespace Tests\Functional;

class TweetsTest extends BaseTestCase {

    /** @test */
    public function has_less_than_ten_tweets() {
        $response = $this->runApp('GET', '/tweets');
        $this->assertEquals(200, $response->getStatusCode());
        $this->assertLessThanOrEqual(10, count(json_decode($response->getBody())));
    }

    /** @test */
    public function has_the_correct_tweet_interface() {
        $atLeastWeGotATweet = false;
        for ($i = 0; $i < 10; $i++) {
            $response = $this->runApp('GET', '/tweets/' . rand(1, 15));
            if ($response->getStatusCode() == 200) {
                $atLeastWeGotATweet = true;
                $tweet = (array) json_decode($response->getBody());
                $this->assertArrayHasKey('created_at', $tweet);
                $this->assertArrayHasKey('text', $tweet);
                if (isset($tweet['in_reply'])) {
                    $in_reply = (array) $tweet['in_reply'];
                    $this->assertArrayHasKey('id', $in_reply);
                    $this->assertArrayHasKey('name', $in_reply);
                }
            }
        }
        $this->assertTrue($atLeastWeGotATweet);
    }

}
