<?php


    class PDOConfig extends PDO{
      private $engine = "mysql";
      private $host = "127.0.0.1";
      private $database = "geostatics";
      private $user = "root";
      private $pass = "";


        static private $instance = null;

        static public function getInstance() {
            if (null === self::$instance) {
                $cl = __CLASS__;
                self::$instance = new $cl;
            }
            return self::$instance;
        }

        public function __construct(){
            $dns = $this->engine . ':host=' . $this->host . ";dbname=" . $this->database;
            parent::__construct($dns, $this->user, $this->pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
            //parent::setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //parent::setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            //parent::setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
        }
        private function __clone(){}
    }

?>
