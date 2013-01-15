<?php


$cmd = $_REQUEST ['form_var_register'];
if ($cmd == 'form_register_user') {
	$data_array = array ();
	$data_array ['username'] = $_REQUEST ['username'];
	$data_array ['password'] = $_REQUEST ['password'];
	$data_array ['email'] = $_REQUEST ['email'];
	$data_array ['address'] = $_REQUEST ['address'];
	$data_array ['phone'] = $_REQUEST ['phone'];
	
	
	if ($_REQUEST ['password'] != $_REQUEST ['confirm_password']) {
		
		echo "<div id='alertid' class='alert alert-error'><button type=button class=close data-dismiss=alert>x</button>Confirm Password Not Match!</div>";
	} else {
		$register_true = $chimpu->insert( 'users', $data_array );
	}
	 
	
	
	if ($register_true) {
		echo "Updated";
	}else
	{
		echo "<div id='alertid' class='alert alert-error'><button type=button class=close data-dismiss=alert>x</button>Fields Empty!</div>";
	}
}
?>