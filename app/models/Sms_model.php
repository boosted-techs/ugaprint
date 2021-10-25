<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2021-03-30
 * Time: 21:23
 */



require 'twilio/src/Twilio/autoload.php';
use Twilio\Rest\Client;
class Sms_model extends Model {
    function __construct() {
        parent::__construct();
    }

    function send_auth($to, $message) {
        $sid = 'ACcb8c595241025c781008ba9fc635c989';
        $token = 'a7a1240cbf9318d12d5d70084ebc936f';
        $client = new Client($sid, $token);

        $client->messages->create(
        // the number you'd like to send the message to
            ''.$to.'',
            [
                // A Twilio phone number you purchased at twilio.com/console
                'from' => '+19518214987',
                // the body of the text message you'd like to send
                'body' => "".$message.""
            ]
        );
    }

    function send_welcome_sms($names, $phone_number, $email) {
        $message = "Hello ".ucfirst($names). ", your account has been created on BINSAID DB. Check your email " . $email . " for instructions.";
        $this->send_auth($phone_number, $message);
    }

}