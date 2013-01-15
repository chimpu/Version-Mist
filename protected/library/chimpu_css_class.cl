<?php

Class Chimpu_css_class  {
	
	private $paths = array ();
	
	function getdir($dir) {
		if ($dh = opendir ( $dir )) {
				
			$files = Array ();
			$inner_files = Array ();
				
			while ( $file = readdir ( $dh ) ) {
				if ($file != "." && $file != ".." && $file [0] != '.') {
					if (is_dir ( $dir . "/" . $file )) {
						$inner_files = self::getdir ( $dir . "/" . $file );
						if (is_array ( $inner_files ))
							$files = array_merge ( $files, $inner_files );
					} else {
						array_push ( $files, $dir . "/" . $file );
					}
				}
			}
				
			closedir ( $dh );
			return $files;
		}
	}
	function define_css() {
		Global $themename;
		$cssjob = self::getdir ( 'layout/' . $themename . '/css' );
		foreach ( $cssjob as $src ) {
			$paths [] = "<link rel='stylesheet' type='text/css' href='$src'>";
		}
		return $paths;
	}
}

?>