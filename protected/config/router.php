<?php
/**
 * This controller routes all incoming requests to the appropriate controller
 */

//fetch the passed request
$request = $_SERVER['QUERY_STRING'];

//parse the page request and other GET variables
$parsed = explode('?' , $request);

//print_r($parsed);
//the page is the first element
 

$parsed = explode('=' ,$parsed['0']);

 

$page= $parsed['1'];



//$request=pathinfo($_SERVER['REQUEST_URI']);

//$page = $request['filename'];


//the rest of the array are get statements, parse them out.
$getVars = array();
foreach ($parsed as $argument)
{
	//split GET vars along '=' symbol to separate variable, values
	list($variable , $value) = explode('=' , $argument);
	$getVars[$variable] = urldecode($value);
}

//get target
if($page=='')
{
	$target=SERVER_ROOT . '/protected/views/frontend/home.ctf';
}
else
{
//compute the path to the file
$target = SERVER_ROOT . '/protected/views/frontend/' . $page . '.ctf';
}


$header = SERVER_ROOT . '/protected/config/layout/header.ctf';
$footer = SERVER_ROOT . '/protected/config/layout/footer.ctf';
$error = SERVER_ROOT . '/protected/config/layout/404.ctf';

/*Directories that contain classes*/
$classesDir = array (
		SERVER_ROOT.'/protected/library/',
);

function __autoload($class_name) {
	global $classesDir;
	foreach ($classesDir as $directory) {
		if (file_exists($directory . $class_name . '.cl')) {
			include_once ($directory . $class_name . '.cl');
			return;
		}
	}
}
include_once SERVER_ROOT . '/protected/config/' . 'config.php';
$chimpu = new Chimpu_app_database( $db_connect );
require_once SERVER_ROOT.'/protected/controllers/post_controller.php';



// Initiallising Css Class

$getcss = new Chimpu_css_class();
$css = $getcss->define_css ();
// To See the list of css uncomment the following code
// print_r($css);

// Initiallising js class
$getjs = new Chimpu_js_class ();
$js = $getjs->define_js ();

// To See the list of js uncomment the following code
// print_r($js);
if (file_exists($target))
{	
	include_once($header);
	include_once($target);	
	include_once($footer);
}
else
{	
	include_once($error);
	include_once($footer); 
	
}