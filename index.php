<?php
/**
 * Define document paths
 */
define ( 'SERVER_ROOT', dirname ( __FILE__ ) );
define ( 'SITE_ROOT', $_SERVER ['SERVER_NAME'] );

/**
 * Fetch the router
 */
require_once (SERVER_ROOT . '/protected/config/' . 'router.php');
 