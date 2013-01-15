<?php
class Chimpu_js_class {
	private $paths_js = array ();
	
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
	
	function define_js() {
		Global $themename;
		$jsjob = self::getdir ( 'layout/' . $themename . '/js' );
		
		foreach ( $jsjob as $src ) {
			
			$paths_js [] = "<script type='text/javascript' src='$src'></script>";
		
		}
		return $paths_js;
	
	}

}
?>