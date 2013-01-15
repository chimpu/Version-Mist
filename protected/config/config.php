<?php 
/*
 * Application Name
 * Applications Site desc
 * */
$appname="Chimpu Framework";
$appdesc="Chimpu Framework is a PHP Based Scalable And Robust Frameowork that can suit any industry standards";

/*
 * Theme folder = www/layout/yourfolder
* Create a folder named css in layout/yourfolder and place all your css in it
* Create a folder names img in layout/yourfolder and place all your images in it
*  Create a folder names js in layout/yourfolder and place all your jquery in it
*  */
$themename="default"; //change it to your theme folder name ( webroot/layout/yourthemename) 
$image="layout/".$themename."/img/";
$url="seo";//$url="seo" for SEO friendly URLS and TURBO page load speed OR else $url="default";


$url_obj=new Chimpu_seo;
$url_obj->seo_url($url);

/**
 * Define Database Connection
 */
$db_connect = array(
			'host' => 'localhost',
			'user' => 'chimpu',
			'pass' => 'chimpu',
			'db' => 'chimpu'
		);


?>