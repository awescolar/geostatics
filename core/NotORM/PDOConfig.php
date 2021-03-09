<?php
    class PDOConfig extends PDO{
        private $engine = "mysql";
        private $host = "127.0.0.1";
        private $database = "geostatics";
        private $user = "root";
        private $pass = "";

        static private $instance = null;

        static public function getInstance(){
            if(null === self::$instance){
                $cl = __CLASS__;
                self::$instance = new $cl;
            }
            return self::$instance;
        }

        public function __construct(){
            $dns = $this->engire . ':dbname=' . $this->database . ";host=" . $this->host;
            parent::__construct($dns, $this->user, $this->pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        }

        private function __clone(){}
    }

?>