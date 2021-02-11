<?php
require './core/flight/Flight.php';

Flight::route('/', function(){
    echo 'hello world!';
});

Flight::start();
